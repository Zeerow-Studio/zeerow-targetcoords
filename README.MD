# Target Coords - Zeerow Studio

Um script para FiveM que permite obter coordenadas precisas de qualquer ponto do mapa através de um sistema de mira visual intuitivo e fácil de usar.

## 📋 Características

- **Sistema de Mira Visual**: Marcador 3D que segue o cursor da câmera
- **Raycast Preciso**: Detecção precisa de superfícies e objetos
- **Interface Simples**: Ativação por comando e confirmação com tecla E
- **Coordenadas Exatas**: Retorna coordenadas X, Y, Z com precisão de 2 casas decimais
- **Sistema de Permissões**: Suporte para controle de acesso via vRP (opcional)
- **Performance Otimizada**: Raycast eficiente com distância configurável


## 🚀 Instalação

1. Faça o download do script
2. Extraia os arquivos para a pasta `resources` do seu servidor
3. Adicione `ensure zeerow-targetcoords` ao seu `server.cfg`
4. Reinicie o servidor


## 📁 Estrutura de Arquivos

```plaintext
zeerow-targetcoords/
├── fxmanifest.lua
├── client/
│   └── main.lua
├── server/
│   └── main.lua
└── README.md
```

## 🎮 Como Usar

1. Digite o comando `/targetcoords` no chat
2. Um marcador laranja aparecerá seguindo sua mira
3. Aponte para o local desejado
4. Pressione **E** para capturar as coordenadas
5. As coordenadas serão exibidas no console e enviadas ao servidor


## ⚙️ Configuração

Você pode personalizar o script editando as configurações no arquivo `client/main.lua`:

### Configurações do Marcador

```lua
local Config = {
  MARKER_TYPE = 28,                                    -- Tipo do marcador
  MARKER_SIZE = 0.05,                                  -- Tamanho do marcador
  MARKER_COLOR = { r = 247, g = 85, b = 16, a = 100 }, -- Cor (laranja)
  RAYCAST_DISTANCE = 25.0,                             -- Distância máxima do raycast
  INPUT_KEY = 38,                                      -- Tecla E (38)
}
```

### Sistema de Permissões (vRP)

Para ativar o sistema de permissões, descomente as linhas no arquivo `server/main.lua`:

```lua
local Proxy = module("vrp","lib/Proxy")
local vRP = Proxy.getInterface("vRP")

-- Dentro do comando
local user_id = vRP.getUserId(source)
if not vRP.hasPermission(user_id, "targetcoords.permission") then
  TriggerClientEvent('Notify',source,'amarelo','Você não tem permissão para usar este comando.',5000)
  return
end
```


## 🎯 Casos de Uso

- **Desenvolvimento**: Obter coordenadas para posicionar objetos, NPCs, etc.
- **Administração**: Localizar pontos específicos no mapa
- **Criação de Conteúdo**: Definir locais para eventos, lojas, etc.
- **Debugging**: Identificar coordenadas problemáticas


## 📊 Performance

- **Impacto Mínimo**: Ativo apenas quando em uso
- **Raycast Eficiente**: Distância limitada para otimização
- **Threading Inteligente**: Para automaticamente após uso


## 💝 Gratuito e Open Source

Este script é **100% gratuito** e de código aberto! Você pode:

- ✅ Usar em seu servidor sem custos
- ✅ Modificar conforme suas necessidades
- ✅ Estudar o código para aprender
- ✅ Contribuir com melhorias


## 📝 Changelog

### v1.0.0

- Lançamento inicial
- Sistema de mira visual com marcador 3D
- Comando `/targetcoords` para ativação
- Raycast preciso para detecção de superfícies
- Suporte opcional para sistema de permissões vRP


## 🛠️ Personalização Avançada

### Mudando a Cor do Marcador

```lua
MARKER_COLOR = { r = 247, g = 85, b = 16, a = 100 }, -- Laranja
```

### Alterando a Tecla de Confirmação

```lua
INPUT_KEY = 191, -- ENTER
-- Consulte: https://docs.fivem.net/docs/game-references/controls/
```

### Aumentando a Distância

```lua
RAYCAST_DISTANCE = 50.0, -- 50 metros
```

## 📞 Suporte

Para suporte e dúvidas:

- **Discord**: [Zeerow Studio](https://discord.gg/zeerow)

---

**Desenvolvido com ❤️ pela Zeerow Studio**