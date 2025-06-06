# Keith McDonnell's Quantitative Research

A comprehensive collection of quantitative finance research articles covering trading strategies, risk management, derivatives pricing, and machine learning applications in finance.

## 🚀 Quick Start

1. Clone the repository:
```bash
git clone https://github.com/yourusername/quantitative-research-blog.git
cd quantitative-research-blog
```

2. Install dependencies:
```bash
make install
```

3. Build and view the book:
```bash
make serve
```

## 🛠 Makefile Commands

| Command | Description |
|---------|-------------|
| `make help` | Show available commands |
| `make install` | Install dependencies |
| `make build` | Build the Jupyter Book |
| `make serve` | Build and open book in browser |
| `make clean` | Clean build artifacts |
| `make test` | Test the build process |
| `make deploy` | Deploy to GitHub Pages |
| `make structure` | Create content directory structure |
| `make format` | Organize content files into directories |
| `make dev` | Development workflow (clean + build + serve) |
| `make prod` | Production workflow (test + deploy) |

## 📚 Content Structure

- **🎯 Trading Strategies**: `content/trading-strategies/`
  - Time Series Momentum Strategies
  - Mean Reversion Analysis
  - Pairs Trading Strategies
  - Algorithmic Execution Strategies

- **📈 Portfolio & Risk**: `content/portfolio-risk/`
  - Modern Portfolio Theory
  - Value at Risk Models
  - Volatility Forecasting
  - Backtesting Frameworks

- **💰 Derivatives & Fixed Income**: `content/derivatives-fixed-income/`
  - Options Pricing Models
  - Fixed Income Analytics
  - Credit Risk Modeling

- **🔍 Market Analysis**: `content/market-analysis/`
  - Multi-Factor Models
  - Market Microstructure
  - Regime Detection
  - Network Analysis

- **🤖 ML & Data**: `content/ml-data/`
  - Machine Learning for Returns
  - Alternative Data Sources
  - Cryptocurrency Analysis

## 🔄 Development Workflow

### Adding New Articles
1. Create new `.md` file in appropriate `content/` subdirectory
2. Update `_toc.yml` to include the new article
3. Test locally: `make dev`
4. Commit changes: `git add . && git commit -m "feat: add new article"`

### Deploying Changes
```bash
# Test everything works
make test

# Deploy to GitHub Pages
make deploy
```

### First-time Setup
```bash
# Initialize repository
git init
git add .
git commit -m "Initial commit"

# Add remote and push
git remote add origin https://github.com/yourusername/repo.git
git push -u origin main

# Create content structure
make structure

# Organize existing files
make format

# Deploy for the first time
make deploy
```

## 🏗 Project Structure

```
my-jupyter-book/
├── .gitignore
├── README.md
├── Makefile
├── requirements.txt
├── _config.yml
├── _toc.yml
├── intro.md
├── content/
│   ├── trading-strategies/
│   ├── portfolio-risk/
│   ├── derivatives-fixed-income/
│   ├── market-analysis/
│   └── ml-data/
├── _static/
│   ├── custom.css
│   └── images/
├── notebooks/
├── data/
└── references.bib
```

## 📖 Live Site

The site will be available at: `https://yourusername.github.io/quantitative-research-blog`

## 🔧 Requirements

- Python 3.8+
- Make
- Git

See `requirements.txt` for Python dependencies.

## 📄 License

This work is licensed under [MIT License](LICENSE).

## 📧 Contact

- Email: your.email@example.com
- LinkedIn: [Your Profile](https://linkedin.com/in/yourprofile)
- GitHub: [@yourusername](https://github.com/yourusername)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-article`)
3. Make your changes
4. Test the build with `make test`
5. Submit a pull request

## 📝 Notes

- Use `make dev` for quick development iteration
- Use `make prod` when ready to deploy
- All content should be in Markdown format
- Images should be placed in `_static/images/`
- References should be added to `references.bib`