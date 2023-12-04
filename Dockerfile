FROM python:3.11-alpine
WORKDIR /app
RUN pip install Flask
COPY . /app
EXPOSE 80
CMD ["python3", "-u", "calculator.py"]
