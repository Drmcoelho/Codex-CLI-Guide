#!/bin/zsh

# xcode-control.sh
# Automação de Simuladores iOS via CLI

echo "📱 Xcode CLI Controller"
echo "======================="

# Check environment
if ! xcrun simctl list > /dev/null 2>&1; then
    echo "❌ Erro: 'simctl' não encontrado ou inoperante."
    echo "Diagnóstico: Seu xcode-select provavelmente aponta para '/Library/Developer/CommandLineTools'."
    echo "Solução: Aponte para o Xcode completo rodando:"
    echo "sudo xcode-select -s /Applications/Xcode.app"
    exit 1
fi

# 1. Listar dispositivos disponíveis (booted e shutdown)
echo "\n🔍 Dispositivos Disponíveis:"
xcrun simctl list devices available | grep "iPhone" | head -n 5

# 2. Perguntar qual dispositivo bootar (hardcoded para demo, mas poderia ser interativo)
DEVICE_NAME="iPhone 15"
echo "\n🚀 Tentando bootar o simulador: $DEVICE_NAME..."

# Verifica se já está bootado
if xcrun simctl list devices | grep "$DEVICE_NAME" | grep -q "Booted"; then
    echo "✅ $DEVICE_NAME já está rodando."
else
    # Tenta bootar (pode falhar se o runtime não estiver instalado, então capturamos erro)
    xcrun simctl boot "$DEVICE_NAME" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "✅ $DEVICE_NAME iniciado com sucesso!"
    else
        echo "⚠️  Não foi possível iniciar '$DEVICE_NAME'. Tentando o primeiro disponível..."
        # Fallback: pega o UUID do primeiro disponível
        FIRST_UUID=$(xcrun simctl list devices available -j | python3 -c "import sys, json; print(json.load(sys.stdin))['devices'][list(json.load(sys.stdin))['devices'].keys())[0]][0]['udid']")
        xcrun simctl boot "$FIRST_UUID"
        echo "✅ Simulador (UUID: $FIRST_UUID) iniciado."
    fi
fi

# 3. Abrir URL no simulador
URL="https://www.apple.com"
echo "\n🌐 Abrindo $URL no simulador..."
xcrun simctl openurl booted "$URL"

echo "\n✨ Demonstração concluída! (Use 'xcrun simctl shutdown all' para fechar tudo depois)"
