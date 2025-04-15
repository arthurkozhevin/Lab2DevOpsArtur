FROM python:3.10-alpine

RUN addgroup -S arthurgroup && adduser -S arthuruser -G arthurgroup

WORKDIR /app

RUN apk add --no-cache libpq-dev gcc musl-dev

COPY requirements.txt ./

RUN pip install --no-cache -r requirements.txt

COPY ./app .

RUN mkdir -p /app/staticfiles && chown -R arthuruser:arthurgroup /app/staticfiles

EXPOSE 8080

USER arthuruser

ENTRYPOINT ["sh", "/app/entrypoint.sh"]





