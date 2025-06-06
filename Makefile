.PHONY: help install build serve clean test deploy structure format dev prod

# Default target
help:
	@echo "Available commands:"
	@echo "  install    - Install dependencies"
	@echo "  build      - Build the Jupyter Book"
	@echo "  serve      - Build and serve the book locally"
	@echo "  clean      - Clean build artifacts"
	@echo "  test       - Test the build process"
	@echo "  deploy     - Deploy to GitHub Pages"
	@echo "  structure  - Create content directory structure"
	@echo "  format     - Format and organize content files"
	@echo "  dev        - Development workflow (clean + build + serve)"
	@echo "  prod       - Production workflow (test + deploy)"

# Install dependencies
install:
	@echo "Installing dependencies..."
	pip install -r requirements.txt

# Build the book
build:
	@echo "Building Jupyter Book..."
	@if [ -d "venv" ]; then \
		source venv/bin/activate && jupyter-book build .; \
	else \
		jupyter-book build .; \
	fi

# Build and serve locally
serve: build
	@echo "Opening book in browser..."
	@if command -v open >/dev/null 2>&1; then \
		open _build/html/index.html; \
	elif command -v xdg-open >/dev/null 2>&1; then \
		xdg-open _build/html/index.html; \
	else \
		echo "Please open _build/html/index.html in your browser"; \
	fi

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -rf _build/
	rm -rf .jupyter_cache/
	find . -name "__pycache__" -type d -exec rm -rf {} + 2>/dev/null || true
	find . -name "*.pyc" -delete 2>/dev/null || true

# Test build process
test: clean build
	@echo "Testing build completed successfully!"

# Deploy to GitHub Pages
deploy: clean build
	@echo "Deploying to GitHub Pages..."
	@if [ ! -d ".git" ]; then \
		echo "Error: Not a git repository. Run 'git init' first."; \
		exit 1; \
	fi
	@if ! git remote get-url origin >/dev/null 2>&1; then \
		echo "Error: No origin remote found. Add remote first."; \
		exit 1; \
	fi
	@echo "Creating gh-pages branch if it doesn't exist..."
	git checkout -B gh-pages
	git rm -rf . --ignore-unmatch
	cp -r _build/html/* .
	touch .nojekyll
	git add .
	git commit -m "Deploy book $$(date '+%Y-%m-%d %H:%M:%S')" || echo "No changes to deploy"
	git push -f origin gh-pages
	git checkout main
	@echo "Deployed! Visit: https://$$(git config --get remote.origin.url | sed 's/.*github.com[:/]\([^/]*\)\/\([^.]*\).*/\1.github.io\/\2/')"

# Create content directory structure
structure:
	@echo "Creating content directory structure..."
	mkdir -p content/trading-strategies
	mkdir -p content/portfolio-risk
	mkdir -p content/derivatives-fixed-income
	mkdir -p content/market-analysis
	mkdir -p content/ml-data
	mkdir -p _static/images
	mkdir -p notebooks
	mkdir -p data
	@echo "Directory structure created!"

# Format and organize content files
format:
	@echo "Organizing content files..."
	@# Move files to appropriate directories
	@if [ -f "momentum_strategies.md" ]; then mv momentum_strategies.md content/trading-strategies/; fi
	@if [ -f "mean_reversion_analysis.md" ]; then mv mean_reversion_analysis.md content/trading-strategies/; fi
	@if [ -f "pairs_trading.md" ]; then mv pairs_trading.md content/trading-strategies/; fi
	@if [ -f "algorithmic_execution.md" ]; then mv algorithmic_execution.md content/trading-strategies/; fi
	@if [ -f "portfolio_optimization.md" ]; then mv portfolio_optimization.md content/portfolio-risk/; fi
	@if [ -f "risk_models.md" ]; then mv risk_models.md content/portfolio-risk/; fi
	@if [ -f "volatility_modeling.md" ]; then mv volatility_modeling.md content/portfolio-risk/; fi
	@if [ -f "backtesting_framework.md" ]; then mv backtesting_framework.md content/portfolio-risk/; fi
	@if [ -f "options_pricing.md" ]; then mv options_pricing.md content/derivatives-fixed-income/; fi
	@if [ -f "fixed_income_analytics.md" ]; then mv fixed_income_analytics.md content/derivatives-fixed-income/; fi
	@if [ -f "credit_risk_modeling.md" ]; then mv credit_risk_modeling.md content/derivatives-fixed-income/; fi
	@if [ -f "factor_models.md" ]; then mv factor_models.md content/market-analysis/; fi
	@if [ -f "market_microstructure.md" ]; then mv market_microstructure.md content/market-analysis/; fi
	@if [ -f "regime_detection.md" ]; then mv regime_detection.md content/market-analysis/; fi
	@if [ -f "network_analysis.md" ]; then mv network_analysis.md content/market-analysis/; fi
	@if [ -f "machine_learning_returns.md" ]; then mv machine_learning_returns.md content/ml-data/; fi
	@if [ -f "alternative_data.md" ]; then mv alternative_data.md content/ml-data/; fi
	@if [ -f "cryptocurrency_analysis.md" ]; then mv cryptocurrency_analysis.md content/ml-data/; fi
	@echo "Files organized into content directories!"

# Development workflow
dev: clean build serve

# Production workflow
prod: test deploy