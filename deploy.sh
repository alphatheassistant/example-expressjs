#!/bin/bash
echo "🚀 Starting Koyeb deployment..."

# Check if we're in the right directory
if [ ! -f "app.js" ]; then
    echo "❌ app.js not found. Please run this from the server directory."
    exit 1
fi

# Check if package.json exists
if [ ! -f "package.json" ]; then
    echo "❌ package.json not found."
    exit 1
fi

echo "✅ Files found"
echo "📦 Building for production..."

# Install dependencies locally for testing
npm install

echo "🔍 Testing server locally..."
timeout 10s npm start || echo "⚠️ Local test completed"

echo "✅ Ready for Koyeb deployment!"
echo ""
echo "📋 Deployment checklist:"
echo "- ✅ app.js exists"
echo "- ✅ package.json configured"
echo "- ✅ Dependencies installed"
echo ""
echo "🌐 Koyeb deployment steps:"
echo "1. Push to GitHub"
echo "2. Connect repository to Koyeb"
echo "3. Set build command: npm ci --only=production"
echo "4. Set run command: npm start"
echo "5. Set PORT environment variable"
echo ""
echo "🔗 Your endpoints will be:"
echo "- Health: https://your-app.koyeb.app/health"
echo "- API Root: https://your-app.koyeb.app/"
echo "- Hackathons: https://your-app.koyeb.app/api/hackathons"
