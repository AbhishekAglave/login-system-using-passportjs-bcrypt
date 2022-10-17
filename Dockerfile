# use this configuration only when you manually copied frontend build files to backend/src/frontend

# FROM node:latest

# WORKDIR /app
# COPY package*.json .
# RUN npm install
# COPY . .
# EXPOSE 8000
# CMD ["npm", "start"]




FROM node:alpine AS base
WORKDIR /app

#####################################
#        BACKEND ENVIRONMENT        #
#####################################

FROM base AS backend-base
COPY backend/package.json ./

FROM backend-base AS backend-dev
RUN yarn install && yarn cache clean
CMD ["npm", "start"]


#####################################
#       FRONTEND ENVIRONMENT        #
#####################################

FROM base AS frontend-base
COPY frontend/package.json ./
RUN yarn install
CMD ["npm", "start"]

FROM frontend-base AS frontend-final
COPY frontend/ ./
RUN yarn build

#####################################
#       COMBINED ENVIRONMENT        #
#####################################

FROM backend-base AS final
RUN yarn install --production && yarn cache clean
COPY backend/src ./src
COPY --from=frontend-final /app/build /app/src/public/frontend/
CMD ["npm", "start"]

