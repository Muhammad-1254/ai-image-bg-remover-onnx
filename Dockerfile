FROM python:3.10-slim

RUN useradd -m -u 1000 app

# COPY u2net.onnx /home/.u2net/u2net.onnx

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

USER app


COPY . .

EXPOSE 7860

CMD ["python", "app.py"]