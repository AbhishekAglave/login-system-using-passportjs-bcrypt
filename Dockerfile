FROM node:14 AS base
WORKDIR /app

#####################################
#        BACKEND ENVIRONMENT        #
#####################################

FROM base AS backend-base
COPY backend/package.json ./

FROM backend-base AS backend-dev
RUN npm install
CMD ["npm", "start"]


#####################################
#       FRONTEND ENVIRONMENT        #
#####################################

FROM base AS frontend-base
COPY frontend/package.json ./
RUN npm install
CMD ["npm", "start"]

FROM frontend-base AS frontend-final
COPY frontend/ ./
RUN npm build

#####################################
#       COMBINED ENVIRONMENT        #
#####################################

FROM mongo:latest as mongodb
CMD []


FROM backend-base AS final
RUN npm install --production
COPY backend/src ./src
COPY --from=frontend-final /app/build /app/public/frontend
CMD ["npm", "start"]