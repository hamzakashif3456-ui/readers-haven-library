# Readers' Haven Public Library

A five-page responsive static website built with HTML and CSS, bundled by Parcel, and served by Nginx in a multi-stage Docker image.

## Pages
- `index.html` — Home
- `collections.html` — Book collections
- `membership.html` — Membership plans
- `services.html` — Digital services
- `contact.html` — Contact and feedback form

## Local build
```bash
npm ci
npm run build
```
The generated website is placed in `dist/`. Open `dist/index.html` locally to inspect the build.

## Docker
Build from the repository root:
```bash
docker image build -t <dockerhub-username>/readers-haven:v1-home .
```
Run:
```bash
docker container run -d --name haven-<username> -p 808<Sr>:80 <dockerhub-username>/readers-haven:v1-home
```
Open `http://localhost:808<Sr>` in a browser.

## Team workflow
Use `develop` for integration, `main` for production-ready code, `release/v2.0` for final testing, and `feature/<page-name>` branches for page work. Do not commit `node_modules/`, `dist/`, `.parcel-cache/`, secrets, or access tokens.
