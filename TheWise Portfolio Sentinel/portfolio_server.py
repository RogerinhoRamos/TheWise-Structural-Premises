# -*- coding: utf-8 -*-
"""
TheWise Portfolio Sentinel (TWS)
Servidor Back-end Local em Flask para Monitoramento de Contas MT5 em Tempo Real.
"""

from flask import Flask, request, jsonify, render_template_string
import json
import os

app = Flask(__name__)

DATA_FILE = "portfolio_data.json"

# Dataset Simulado (Mock) de alta fidelidade para o Dashboard funcionar no primeiro boot sem sincronia
MOCK_DATA = {
    "account": {
        "balance": 100000.00,
        "equity": 102450.00,
        "margin": 12500.00,
        "margin_free": 89950.00,
        "profit": 2450.00,
        "leverage": 100,
        "company": "TheWise Institutional",
        "name": "Rogerinho Ramos Sentinel",
        "number": 888888,
        "currency": "BRL"
    },
    "positions": [
        {
            "symbol": "WINM26",
            "ticket": 445582910,
            "volume": 5.0,
            "type": "Compra",
            "price_open": 128450.00,
            "price_current": 128940.00,
            "profit": 490.00,
            "sl": 128000.00,
            "tp": 130000.00,
            "magic": 2026,
            "comment": "TSP Sniper Mode",
            "time": "2026-05-16 21:30:15"
        },
        {
            "symbol": "WDOK26",
            "ticket": 445582911,
            "volume": 2.0,
            "type": "Venda",
            "price_open": 5.1240,
            "price_current": 5.0920,
            "profit": 640.00,
            "sl": 5.1800,
            "tp": 4.9500,
            "magic": 2026,
            "comment": "TSP Pullback Mode",
            "time": "2026-05-16 22:15:00"
        },
        {
            "symbol": "PETR4",
            "ticket": 445582912,
            "volume": 100.0,
            "type": "Compra",
            "price_open": 38.50,
            "price_current": 39.82,
            "profit": 1320.00,
            "sl": 37.00,
            "tp": 42.00,
            "magic": 0,
            "comment": "Operacao Manual",
            "time": "2026-05-16 14:05:32"
        }
    ],
    "history": [
        # Simulação de trades fechados (Manual e Robô) para testar os filtros de datas e conversão
        {"symbol": "WINM26", "ticket": 1001, "volume": 5.0, "type": "Compra", "price_open": 128000.0, "price_close": 128500.0, "profit": 500.0, "sl": 127500.0, "tp": 129000.0, "magic": 2026, "comment": "TSP Trend", "time_open": "2026-05-15 10:00:00", "time_close": "2026-05-15 11:30:00", "swap": 0.0, "commission": -1.50},
        {"symbol": "WINM26", "ticket": 1002, "volume": 5.0, "type": "Venda", "price_open": 128600.0, "price_close": 128300.0, "profit": 300.0, "sl": 128900.0, "tp": 127800.0, "magic": 2026, "comment": "TSP Sniper", "time_open": "2026-05-15 14:00:00", "time_close": "2026-05-15 14:45:00", "swap": 0.0, "commission": -1.50},
        {"symbol": "WDOK26", "ticket": 1003, "volume": 2.0, "type": "Compra", "price_open": 5.1500, "price_close": 5.1200, "profit": -600.0, "sl": 5.1100, "tp": 5.2500, "magic": 0, "comment": "Manual Fibo", "time_open": "2026-05-14 09:15:00", "time_close": "2026-05-14 10:10:00", "swap": 0.0, "commission": -0.80},
        {"symbol": "VALE3", "ticket": 1004, "volume": 200.0, "type": "Compra", "price_open": 64.20, "price_close": 65.80, "profit": 320.0, "sl": 63.00, "tp": 68.00, "magic": 0, "comment": "Manual Suporte", "time_open": "2026-05-10 11:00:00", "time_close": "2026-05-12 16:30:00", "swap": -2.50, "commission": -4.00},
        {"symbol": "WINM26", "ticket": 1005, "volume": 5.0, "type": "Compra", "price_open": 127800.0, "price_close": 128400.0, "profit": 600.0, "sl": 127300.0, "tp": 128800.0, "magic": 2026, "comment": "TSP Pullback", "time_open": "2026-05-05 13:00:00", "time_close": "2026-05-05 15:20:00", "swap": 0.0, "commission": -1.50},
        {"symbol": "WDOK26", "ticket": 1006, "volume": 3.0, "type": "Venda", "price_open": 5.1950, "price_close": 5.1610, "profit": 1020.0, "sl": 5.2400, "tp": 5.0500, "magic": 2026, "comment": "TSP Supreme", "time_open": "2026-04-20 10:30:00", "time_close": "2026-04-22 14:15:00", "swap": -4.20, "commission": -2.10},
        {"symbol": "WINM26", "ticket": 1007, "volume": 5.0, "type": "Compra", "price_open": 125000.0, "price_close": 126200.0, "profit": 1200.0, "sl": 124500.0, "tp": 127000.0, "magic": 2026, "comment": "TSP Trend", "time_open": "2026-04-10 09:05:00", "time_close": "2026-04-10 17:15:00", "swap": 0.0, "commission": -1.50},
        {"symbol": "VALE3", "ticket": 1008, "volume": 100.0, "type": "Compra", "price_open": 66.50, "price_close": 64.10, "profit": -240.0, "sl": 64.00, "tp": 71.00, "magic": 0, "comment": "Manual Rompimento", "time_open": "2026-04-02 10:00:00", "time_close": "2026-04-03 16:50:00", "swap": -1.20, "commission": -2.00}
    ]
}

def load_data():
    if not os.path.exists(DATA_FILE):
        with open(DATA_FILE, "w", encoding="utf-8") as f:
            json.dump(MOCK_DATA, f, ensure_ascii=False, indent=4)
        return MOCK_DATA
    try:
        with open(DATA_FILE, "r", encoding="utf-8") as f:
            return json.load(f)
    except Exception as e:
        print(f"Erro ao carregar banco de dados JSON: {e}")
        return MOCK_DATA

def save_data(data):
    try:
        with open(DATA_FILE, "w", encoding="utf-8") as f:
            json.dump(data, f, ensure_ascii=False, indent=4)
        return True
    except Exception as e:
        print(f"Erro ao salvar banco de dados JSON: {e}")
        return False

@app.route("/")
def index():
    # Carregar o painel premium HTML
    try:
        with open("portfolio_dashboard.html", "r", encoding="utf-8") as f:
            dashboard_html = f.read()
        return render_template_string(dashboard_html)
    except FileNotFoundError:
        return "<h3>TheWise Portfolio Sentinel</h3><p>Painel 'portfolio_dashboard.html' nao encontrado na raiz do servidor. Por favor, aguarde a gravacao da interface!</p>"

@app.route("/api/data", methods=["GET"])
def get_data():
    data = load_data()
    return jsonify(data)

@app.route("/api/update", methods=["POST"])
def update_data():
    try:
        new_data = request.get_json(force=True)
        if not new_data:
            return jsonify({"status": "error", "message": "Payload JSON vazio"}), 400
        
        # Validacao basica dos campos estruturais obrigatorios
        if "account" not in new_data or "positions" not in new_data or "history" not in new_data:
            return jsonify({"status": "error", "message": "Estrutura JSON incompleta"}), 400
        
        if save_data(new_data):
            print(f"[TWS] Sincronia realizada com sucesso: {len(new_data.get('history', []))} trades historicos.")
            return jsonify({"status": "success", "message": "Sentinel atualizado"}), 200
        else:
            return jsonify({"status": "error", "message": "Falha ao gravar arquivo JSON"}), 500
            
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500

if __name__ == "__main__":
    # Garante o carregamento/criacao do arquivo de dados antes do start do servidor
    load_data()
    print("========================================================")
    print("      THEWISE PORTFOLIO SENTINEL (TWS) STARTED          ")
    print("   Servidor local ativo na porta 5000: http://127.0.0.1:5000  ")
    print("========================================================")
    app.run(host="127.0.0.1", port=5000, debug=True)
