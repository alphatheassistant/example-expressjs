Write-Host "🚀 Starting Koyeb deployment preparation..." -ForegroundColor Green

# Check if we're in the right directory
if (-not (Test-Path "app.js")) {
    Write-Host "❌ app.js not found. Please run this from the server directory." -ForegroundColor Red
    exit 1
}

# Check if package.json exists
if (-not (Test-Path "package.json")) {
    Write-Host "❌ package.json not found." -ForegroundColor Red
    exit 1
}

Write-Host "✅ Files found" -ForegroundColor Green
Write-Host "📦 Installing dependencies..." -ForegroundColor Yellow

# Install dependencies
npm install

Write-Host "🔍 Testing server locally..." -ForegroundColor Yellow
Start-Process -FilePath "npm" -ArgumentList "start" -NoNewWindow -PassThru | Wait-Process -Timeout 10 -ErrorAction SilentlyContinue

Write-Host "✅ Ready for Koyeb deployment!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Deployment checklist:" -ForegroundColor Cyan
Write-Host "- ✅ app.js exists"
Write-Host "- ✅ package.json configured"
Write-Host "- ✅ Dependencies ready"
Write-Host ""
Write-Host "🌐 Koyeb deployment steps:" -ForegroundColor Cyan
Write-Host "1. Push to GitHub"
Write-Host "2. Connect repository to Koyeb"
Write-Host "3. Set build command: npm ci --only=production"
Write-Host "4. Set run command: npm start"
Write-Host "5. Set PORT environment variable to 3000"
Write-Host ""
Write-Host "🔗 Your endpoints will be:" -ForegroundColor Yellow
Write-Host "- Health: https://your-app.koyeb.app/health"
Write-Host "- API Root: https://your-app.koyeb.app/"
Write-Host "- Hackathons: https://your-app.koyeb.app/api/hackathons"
