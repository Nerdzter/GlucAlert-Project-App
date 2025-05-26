# 💡 GlucAlert App

O **GlucAlert** é um app mobile + hardware que monitora sinais vitais com foco em **batimentos cardíacos**, **SpO₂** e **hipoglicemia/hiperglicemia**, exibindo gráficos, alertas e relatórios automáticos. É ideal para pessoas que precisam acompanhar sua saúde de forma prática, com ou sem o gadget.

---

## ✅ Status do Projeto

- [x] Estrutura inicial em Flutter com organização modular
- [x] Tela inicial com fluxo de navegação
- [x] Formulário de avaliação de saúde (modo sem gadget)
- [x] Banco de dados local com Hive (em integração)
- [x] ESP32 com sensor removido da Mi Band e comunicação USB-C
- [ ] Integração de leitura em tempo real via USB
- [ ] Gráficos interativos no app
- [ ] Geração de relatório PDF

---

## 📦 Tecnologias Utilizadas

| Categoria        | Tecnologias                  |
|------------------|------------------------------|
| Frontend         | Flutter + Dart               |
| Banco de Dados   | Hive (local, criptografável) |
| Relatórios PDF   | Syncfusion Flutter PDF       |
| Gráficos         | fl_chart                     |
| Conexão Hardware | usb_serial (USB-C com ESP32) |

---

## 📁 Estrutura do Projeto


```
lib/
├── controllers/
├── models/
│   ├── question.dart
│   └── user_anamnesis_data.dart
├── screens/
├── widgets/
│   ├── inputs.dart
│   ├── mode_card.dart
│   ├── question_card.dart
│   └── selectors.dart
└── main.dart
```

---

## ⚙️ Funcionalidades

### Modo com Gadget (ESP32 via USB-C)
- Conexão automática via `usb_serial`
- Coleta de batimentos e oxigênio (SpO₂)
- Gráficos em tempo real
- Relatórios com dados reais exportáveis em PDF

### Modo sem Gadget (Manual)
- Formulário com perguntas de saúde
- Geração de relatório estimado com sugestões
- Modo educativo para usuários sem o sensor

---

## 🎨 UI/UX

- Estilo inspirado no iOS: minimalista, clean e profissional
- Paleta:
  - Azul primário `#007AFF`
  - Verde saúde `#34C759`
  - Vermelho alerta `#FF3B30`
  - Fundo: `#F2F2F7`

---

## 📲 Como rodar o projeto

```bash
flutter pub get
flutter run
```

> Conecte o ESP32 via USB-C no computador ou celular Android para testes.

---

## 🧪 Roadmap

- [ ] Concluir comunicação USB com ESP32
- [ ] Registrar dados no banco local com histórico
- [ ] Animações e melhorias visuais
- [ ] Layout responsivo completo
- [ ] Case físico 3D para o dispositivo

---

## 👥 Contribuidores

- **Nayderson Silva de Oliveira** — Programando Full-stack o aplicativo e toda a integração  
  - Instagram: [@eunayderson](https://instagram.com/eunayderson)
- **Cleber Malta** — Desenvolvendo todo o hardware e estrutura física  
  - Instagram: [@clebermalta_](https://instagram.com/clebermalta_)

---

## 🚀 Propósito

Este projeto visa impactar áreas de **tecnologia e saúde preventiva**, com potencial para:

- Participar de competições de inovação
- Ser incubado como startup
- Auxiliar na democratização do monitoramento de saúde
