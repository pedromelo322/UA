Como **Perito em Arquiteturas**, preparei um plano de endereçamento e configuração para os teus 12 VPCs e respetivos Switches L2.

Para testarmos a **Diferenciação de Tráfego** corretamente, temos de garantir que em cada "local" (Rack) temos tráfego misturado:
1.  **Cliente 1 (VLANs 10, 20, 30):** Tráfego que será encapsulado na porta UDP 4790 e enviado via **MPLS-TE** (Túnel).
2.  **Cliente 2 (Nativo/VLAN 1):** Tráfego que será encapsulado na porta UDP 4789 e sujeito a **QoS (DiffServ)**.

---

### 1. Plano de Endereçamento (IPs dos VPCs)

Vou distribuir os PCs de forma a que os **ímpares sejam Cliente 1** e os **pares sejam Cliente 2**.

#### Datacenter Lisboa (Lado Esquerdo)

| Switch | VPC | Cliente | VLAN | IP Address | Gateway (se necessário) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Switch1** (L11) | **PC1** | Cliente 1 | 10 | `10.10.0.1/22` | (Leaf IP na bridge v10) |
| | **PC2** | Cliente 2 | 1 (Nativo) | `10.40.0.1/22` | (Leaf IP na bridge cl2) |
| **Switch2** (L12) | **PC3** | Cliente 1 | 20 | `10.20.0.1/22` | (Leaf IP na bridge v20) |
| | **PC4** | Cliente 2 | 1 (Nativo) | `10.40.0.2/22` | (Leaf IP na bridge cl2) |
| **Switch3** (L13) | **PC5** | Cliente 1 | 30 | `10.30.0.1/22` | (Leaf IP na bridge v30) |
| | **PC6** | Cliente 2 | 1 (Nativo) | `10.40.0.3/22` | (Leaf IP na bridge cl2) |

#### Datacenter Porto (Lado Direito - Destinos)

| Switch | VPC | Cliente | VLAN | IP Address | Teste de Conectividade |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Switch4** (L21) | **PC7** | Cliente 1 | 10 | `10.10.0.2/22` | PC1 -> PC7 |
| | **PC8** | Cliente 2 | 1 (Nativo) | `10.40.0.4/22` | PC2 -> PC8 |
| **Switch5** (L22) | **PC9** | Cliente 1 | 20 | `10.20.0.2/22` | PC3 -> PC9 |
| | **PC10** | Cliente 2 | 1 (Nativo) | `10.40.0.5/22` | PC4 -> PC10 |
| **Switch6** (L23) | **PC11** | Cliente 1 | 30 | `10.30.0.2/22` | PC5 -> PC11 |
| | **PC12** | Cliente 2 | 1 (Nativo) | `10.40.0.6/22` | PC6 -> PC12 |

---

### 2. Configuração dos VPCs

Em cada VPC, usa o comando `ip`. Exemplo para o PC1 e PC2:

**PC1 (VLAN 10):**
```bash
ip 10.10.0.1/22
save
```

**PC2 (Cliente 2):**
```bash
ip 10.40.0.1/22
save
```
*(Repete a lógica para os restantes conforme a tabela acima)*

---

### 3. Configuração dos Switches L2 (GNS3 Ethernet Switch)

Assumindo que estás a usar o **"Ethernet Switch"** padrão do GNS3, a configuração é feita clicando com o botão direito no switch e escolhendo **"Configure"**.

A lógica para todos os switches é:
*   **Porta 0 (Ligada ao Leaf/Router):** Deve ser **dot1q (Trunk)** para transportar as VLANs (10/20/30) e a VLAN 1 (Nativa).
*   **Porta 1 (Ligada ao PC Ímpar - Cliente 1):** Deve ser **Access** na VLAN respetiva (10, 20 ou 30).
*   **Porta 2 (Ligada ao PC Par - Cliente 2):** Deve ser **Access** na VLAN 1 (Default/Nativa).

#### Configuração Switch1 (Lisboa - L11)
1.  **Port 0 (eth1 do Leaf):** VLAN 1 (Native), Type: **dot1q**
2.  **Port 1 (PC1):** VLAN **10**, Type: **access**
3.  **Port 2 (PC2):** VLAN 1, Type: **access**
4.  *Clica em "Add" ou "Apply" para cada porta.*

#### Configuração Switch2 (Lisboa - L12)
1.  **Port 0:** VLAN 1, Type: **dot1q**
2.  **Port 1 (PC3):** VLAN **20**, Type: **access**
3.  **Port 2 (PC4):** VLAN 1, Type: **access**

#### Configuração Switch3 (Lisboa - L13)
1.  **Port 0:** VLAN 1, Type: **dot1q**
2.  **Port 1 (PC5):** VLAN **30**, Type: **access**
3.  **Port 2 (PC6):** VLAN 1, Type: **access**

*(Repete a mesma lógica para o Porto: Switch4=Vlan10, Switch5=Vlan20, Switch6=Vlan30).*

---

### O que isto vai permitir testar?

Ao configurares assim:

1.  Quando o **PC1 (VLAN 10)** envia dados:
    *   O Switch1 coloca a Tag 10.
    *   O Leaf L11 recebe na sub-interface `eth1.10`.
    *   O Leaf encaminha para a bridge `br_v10` -> `vxlan10010`.
    *   Sai com porta **UDP 4790**.
    *   **Resultado:** O Router Cisco vê a porta 4790 e envia pelo **Túnel MPLS** (Garantia de Banda e Resiliência).

2.  Quando o **PC2 (Nativo)** envia dados:
    *   O Switch1 não coloca tag (ou usa tag 1).
    *   O Leaf L11 recebe na interface `eth1`.
    *   O Leaf encaminha para a bridge `br_cl2` -> `vxlan20000`.
    *   Sai com porta **UDP 4789**.
    *   **Resultado:** O Router Cisco vê a porta 4789 e aplica a política de **QoS (DiffServ/AF)** na interface física.

Esta é a configuração perfeita para demonstrares os dois requisitos do projeto simultaneamente.
