FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel

# Deshabilitar los repositorios problemáticos de NVIDIA
RUN sed -i 's|^deb |# deb |' /etc/apt/sources.list.d/*

# Actualizar paquetes e instalar python3-pip
RUN apt-get update && apt-get install -y python3-pip

# Habilitar los repositorios de NVIDIA de nuevo
RUN sed -i 's|^# deb |deb |' /etc/apt/sources.list.d/*

# Instalar Jupyter, Matplotlib y versiones específicas de Jinja2, MarkupSafe y Traitlets
RUN pip install jupyter matplotlib jinja2==2.11.3 markupsafe==2.0.1 traitlets==5.1.0

# Crear un directorio de trabajo
WORKDIR /workspace

# Exponer el puerto de Jupyter Notebook
EXPOSE 8888

# Comando por defecto para iniciar Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--notebook-dir=/workspace"]

