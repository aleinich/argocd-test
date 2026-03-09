# argocd-test
just for testing

```mermaid
graph TD
    subgraph Client_Layer [Client Layer]
        A[Web App - React]
        B[Mobile App - iOS/Android]
    end

    subgraph API_Gateway_Layer [Access Layer]
        C{API Gateway / Nginx}
    end

    subgraph Service_Layer [Backend Microservices]
        D[Auth Service]
        E[User Service]
        F[Order Processing]
    end

    subgraph Data_Layer [Persistence Layer]
        G[(PostgreSQL - Users)]
        H[(Redis - Cache)]
        I[(MongoDB - Orders)]
    end

    %% Relazioni
    A & B --> C
    C --> D
    C --> E
    C --> F

    D --> G
    E --> G
    E --> H
    F --> I
    F -.->|Event| E

    %% Styling
    style C fill:#f96,stroke:#333,stroke-width:2px
    style G fill:#69f,stroke:#fff
    style H fill:#69f,stroke:#fff
    style I fill:#69f,stroke:#fff
