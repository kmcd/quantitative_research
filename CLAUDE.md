# CLAUDE.md - Project Instructions

## Project Overview
This is a quantitative research Jupyter Book project containing financial research articles organized into thematic directories.

## Key Commands
- `make install` - Install Python dependencies
- `make build` - Build the Jupyter Book
- `make serve` - Build and open book in browser
- `make clean` - Clean build artifacts
- `make test` - Test the build process
- `make deploy` - Deploy to GitHub Pages
- `make dev` - Development workflow (clean + build + serve)

## Project Structure
- `content/` - Main content directory with subdirectories:
  - `trading-strategies/` - Trading strategy articles
  - `portfolio-risk/` - Portfolio optimization and risk management
  - `derivatives-fixed-income/` - Derivatives and fixed income analytics
  - `market-analysis/` - Market analysis and factor models
  - `ml-data/` - Machine learning and alternative data
- `_static/` - Static assets (CSS, images)
- `notebooks/` - Jupyter notebooks
- `data/` - Data files
- `_config.yml` - Jupyter Book configuration
- `_toc.yml` - Table of contents
- `requirements.txt` - Python dependencies

## Development Workflow
1. When adding new content, place in appropriate `content/` subdirectory
2. Update `_toc.yml` to include new articles
3. Test locally with `make dev`
4. When ready to deploy, use `make deploy`

## Testing
Always run `make test` before deploying to ensure the build process works correctly.

## Dependencies
- Python 3.8+
- jupyter-book
- matplotlib
- numpy

## Virtual Environment
If a `venv/` directory exists, the Makefile will automatically activate it during builds.