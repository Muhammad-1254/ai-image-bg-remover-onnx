FROM python:3.9

RUN useradd -m -u 1000 app

# COPY u2net.onnx /home/.u2net/u2net.onnx

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

USER app


COPY . .

EXPOSE 5100

CMD ["python", "app.py"]