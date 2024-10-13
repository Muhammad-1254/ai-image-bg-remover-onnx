FROM python:3.9


# Add this line
ENV NUMBA_DISABLE_JIT=1 

# COPY u2net.onnx /home/.u2net/u2net.onnx

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Mount a local directory for numba cache
VOLUME ["/app/numba_cache"]


COPY . .

EXPOSE 5100

CMD ["python", "app.py"]