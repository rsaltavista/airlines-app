# Airlines App

Este projeto é uma aplicação de gerenciamento de voos desenvolvida utilizando Swift, SwiftUI e UIKit, com arquitetura MVVM (Model-View-ViewModel). A aplicação busca dados de voos de um arquivo JSON estático e exibe-os em uma lista, permitindo aplicar filtros como voos concluídos, cancelados, e em andamento.

## Funcionalidades Principais

- Exibição de voos baseados em dados JSON.
- Aplicação de filtros: Todos, Concluídos, Cancelados, Programados, e Em Andamento.
- Integração entre SwiftUI e UIKit para navegação.
- Ícones de status (concluído/cancelado).
- Arquitetura MVVM.

## Decisões de Design Pattern

1. **Arquitetura MVVM**: Separação clara entre lógica de negócios e interface para facilitar a manutenção.
  
2. **SwiftUI e UIKit**: `SwiftUI` é usado na tela inicial para simplicidade, enquanto `UIKit` é usado para telas mais complexas.

3. **Testes Unitários**: Implementação de Mocks e Spies para garantir a qualidade e facilitar o desenvolvimento de testes.

4. **Protocolos**: Uso de `Protocolos` para facilitar as atualizações futuras, substituição e testes.

## Testes Unitários

- **Mocks**: Simulam dependências externas como `FlightService`.
- **Spies**: Verificam se os métodos foram corretamente invocados.


## Demonstração do App: 


https://github.com/user-attachments/assets/9eb20309-61a7-440d-baeb-669a955462ec



## Como Rodar o Projeto

1. Clone o repositório.
2. Abra o projeto no Xcode.
3. Execute a aplicação em um simulador ou dispositivo.
4. Execute os testes unitários (`Cmd + U` no Xcode) para garantir que tudo está funcionando corretamente.

---

Este projeto demonstra a criação de uma aplicação modular e testável, com foco em boas práticas de desenvolvimento para iOS.
