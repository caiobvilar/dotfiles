**SCISPACE** - `SCHOLAR60`
# Plano de Trabalho - PhD

## Possível tema:
Estudo de implantação dinâmica de serviços na computação de borda em dispositivos de altas restrições de recursos e de processamento colaborativo e inteligência distribuída

Imagine que cada Edge Device na Cidade é um nó com digital twins específicos que garantem certas funcionalidades (temperatura em uma região da cidade, nível de poluição sonora, nível de luminosidade, nível de gases tóxicos, ocu). Essas funcionalidades garantem funções específicas para cada dipositivo. Porém, essas funcionalidades físicas (como câmeras, microfones, sensores de radar de velocidade, temperatura, umidade, pressão, níveis de certos gases tóxicos na atmosfera) podem ser acopladas a funcionalidades virtuais (algoritmos clássicos, inteligência artificial, sistemas de controle) e fornecerem métricas, grandezas e informações mais complexas e de maior valor para o gerenciamento de uma cidade.

-> Habilidade de nós publicarem dados de especificações de seus sensores e serviços para que outros nós possam utilizá-los
-> Habilidade de orquestrar serviços em cima dos digital twins de cada nó ou grupos de nós;
-> Habilidade de criar serviços super-impostos e simultâneos
-> Habilidade de garantir a anonimização de dados em diferentes níveis
-> Habilidade de garantir a rastreabilidade dos dados em diferentes níveis
-> Habilidade de garantir a segurança dos dados em diferentes níveis de acesso
-> Possibilidade de simular cenários e melhorar processos/serviços e modelos com dados reais anonimizados.

Obs.: no final, acredito que tudo isso pode ser realizado com alguns processos de criptografia e um protocolo robusto e extremamente eficiente nos quesitos de espaço e "processabilidade".

## SCISPACE

Edge computing plays a pivotal role in enhancing services within smart cities by enabling real-time data processing and efficient resource orchestration. This paradigm shift from centralized cloud computing to distributed edge environments addresses the unique challenges posed by urban management, such as latency and network congestion. The following sections elaborate on key aspects of edge computing in smart cities.
**Real-Time Data Processing**

    Edge computing minimizes latency by processing data closer to the source, which is crucial for applications like intelligent transport systems and urban management(Supriyanto & Santoso, 2024).
    Case studies demonstrate significant improvements in data efficiency, allowing cities to respond swiftly to dynamic urban demands(Supriyanto & Santoso, 2024).

**Distributed Orchestration**

    New orchestration methods are essential for managing both cloud and edge services, particularly in resource-constrained environments(Rosmaninho et al., 2024).
    Innovations like the Antlion-based orchestration algorithm enhance resource utilization and reduce energy consumption, proving effective in healthcare applications(Madhusudhan & Gupta, 2024).

**Autonomous and Resilient Architectures**

    The AR-Edge architecture integrates AI and blockchain to create secure and resilient edge networks, addressing interoperability challenges in smart cities(Xu et al., 2024).
    This architecture supports dynamic IoT ecosystems, ensuring efficient resource coordination and optimization(Xu et al., 2024).

While edge computing offers numerous advantages for smart cities, challenges remain in ensuring interoperability and security across diverse systems. Addressing these issues is crucial for the successful implementation of smart city initiatives


## Current state of edge computing in urban environments
As edge computing matures, its implementation in urban environments is rapidly evolving. This section provides a brief overview of the  current landscape of edge computing in smart cities, highlighting some existing implementations, success stories, challenges, and some lessons.
Edge computing is already effectively deployed in numerous smart city applications to improve quality of life in various ways. For instance, cities like Singapore, San Francisco, and Barcelona utilize edge computing solutions to manage traffic in real-time through optimized traffic flow strategies, leading to reduced congestion [16]. Chicago employs edge-based video analytics for public safety, enabling real-time threat assessments and quicker response times [17]. New York City’s LinkNYC project replaced phone booths with Wi-Fi kiosks incorporating edge computing capabilities, providing citizens with real-time information and services [18]. Amsterdam uses edge computing for air quality monitoring and noise pollution control, allowing for rapid responses to environmental changes [19]. A purpose-built smart city in Songdo, South Korea, extensively utilizes edge computing in its urban management systems, demonstrating the potential of integrated edge solutions in greenfield urban developments [20]. Additionally, cities like Oslo implement edge computing in power distribution systems, resulting in smarter grids and improved fault detection [21]. While we observed many successful use cases and the potential of edge computing in urban settings, there are still challenges that hinder its widespread adoption:

* **Standardization**: The lack of unified standards for edge computing architectures and protocols hinders interoperability and scalability across different smart city systems [22].
* **Security concerns**: The distributed nature of edge computing introduces new security vulnerabilities that must be addressed to protect sensitive urban data [9].
* * **Energy efficiency**: Powering numerous edge devices and ensuring their efficient operation remains a significant challenge, particularly in resource-constrained urban environments [21].
* **Data governance**: Issues surrounding data ownership, privacy, and regulatory compliance are becoming increasingly complex as more data is processed at the edge [9, 23].
* **Infrastructure integration**: Retrofitting existing urban infrastructure to accommodate edge computing capabilities can be costly and logistically challenging [22].

O objetivo é avaliar técnicas diferentes de orquestração de serviços e micro-serviços para smart cities em cima de um protocolo robusto e altamente adaptável, independente de tecnologia de comunicação. Esse protocolo deve ser avaliado por meio de métodos formais. Esses algoritmos podem envolver métodos clássicos e/ou algoritmos que envolvam técnicas de inteligência artificial, como Machine Learning e Deep Learning. 