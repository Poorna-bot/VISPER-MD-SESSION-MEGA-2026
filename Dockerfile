# Official Node.js image එක පාවිච්චි කිරීම
FROM node:20-bookworm

# සිස්ටම් එකට අවශ්‍ය updates සහ dependencies (අවශ්‍ය වුණොත්)
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Working directory එක සකස් කිරීම
WORKDIR /app

# Dependencies install කිරීම (Caching පාවිච්චි කර වේගවත් කිරීමට)
COPY package*.json ./
RUN npm install --production

# ඉතිරි files සියල්ල copy කිරීම
COPY . .

# Railway එකෙන් දෙන PORT එකට expose කිරීම
EXPOSE 8000

# App එක start කරන විධානය
CMD ["npm", "start"]
