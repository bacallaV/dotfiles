# Dotfiles Repository

Este repositorio contiene mis configuraciones personales (**dotfiles**) para distintas herramientas, utilizando **GNU Stow** para administrarlas mediante enlaces simbólicos. Esto permite mantener mi entorno configurado de manera consistente entre múltiples computadoras.

---

## 🚀 Objetivo

Mantener mis configuraciones de programas como Neovim, Zsh, Tmux, Alacritty, etc., dentro de un solo repositorio estructurado y fácil de sincronizar y desplegar en cualquier equipo.

---

## 📦 Dependencias necesarias

Antes de usar este repositorio, asegúrate de tener instaladas estas herramientas:

### 1. **Git**

Para clonar el repositorio y realizar cambios.

### 2. **GNU Stow**

Herramienta que gestiona enlaces simbólicos a partir de carpetas de dotfiles.

#### Instalación

* **macOS (Homebrew)**:

  ```sh
  brew install stow
  ```
* **Debian / Ubuntu / WSL**:

  ```sh
  sudo apt install stow
  ```
* **Arch Linux**:

  ```sh
  sudo pacman -S stow
  ```

> **Nota:** Stow funciona perfectamente en Linux, macOS y WSL. No es habitual en Windows nativo.

---

## 📁 Estructura del repositorio

Cada aplicación o conjunto de configuraciones se organiza en "paquetes". Un paquete es una carpeta que contiene los archivos en la misma estructura en la que deben vivir dentro del sistema.

Ejemplo para Neovim:

```
nvim/
└─ .config/
   └─ nvim/
      ├─ init.lua
      ├─ lua/
      └─ plugins/
```

Ejemplo para Zsh:

```
zsh/
└─ .zshrc
```

Ejemplo para Tmux:

```
tmux/
└─ .tmux.conf
```

Esto permite que Stow coloque los archivos automáticamente en `~/.config`, `~/`, etc.

---

## 🔗 Cómo crear enlaces simbólicos con Stow

Desde el directorio raíz del repositorio de dotfiles:

```sh
cd ~/dotfiles
stow -t ~ nvim
```

* `stow` ejecuta el proceso.
* `-t ~` especifica que los archivos deben enlazarse hacia tu `$HOME`.
* `nvim` es el nombre del paquete.

### ✔ Probar antes de aplicar (dry run)

```sh
stow -n -v -t ~ nvim
```

Esto muestra lo que **haría** Stow sin modificar nada.

### ✔ Deshacer un paquete

```sh
stow -D -t ~ nvim
```

Elimina solo los symlinks creados por Stow.

### ✔ Volver a aplicar cambios (restow)

```sh
stow -R -t ~ nvim
```

---

## 🛠 Cómo crear un nuevo paquete

1. Crear una carpeta con el nombre del paquete:

   ```sh
   mkdir -p nombre_paquete/.config/algo
   ```

2. Mover o copiar tus archivos de configuración originales dentro del paquete.

   Ejemplo para Alacritty:

   ```sh
   mv ~/.config/alacritty ~/dotfiles/alacritty/.config/
   ```

3. Volver a stowear:

   ```sh
   stow -t ~ nombre_paquete
   ```

---

## 🧹 Buenas prácticas

### ✔ Ignorar archivos temporales o generados automáticamente

Incluye un `.gitignore` adecuado. Ejemplo:

```
# LazyVim
.config/nvim/lazy-lock.json
.config/nvim/.cache
.config/nvim/.local

# Swap, undo, sesiones
*.swp
**/session*
**/undo
```

### ✔ Haz respaldos antes de mover configuraciones

Esto evita perder configuraciones previas.

```sh
cp -a ~/.config/nvim ~/nvim_backup_$(date +%Y%m%d_%H%M)
```

### ✔ No almacenar secretos en el repo

No incluir:

* claves privadas
* tokens API
* información sensible

Puedes usar herramientas como `git-crypt` o `sops` para archivos cifrados.

---

## 💻 Cómo usar este repositorio en una nueva máquina

1. Instalar dependencias (`git`, `stow`).
2. Clonar el repositorio:

   ```sh
   git clone git@github.com:TU_USUARIO/dotfiles.git ~/dotfiles
   ```
3. Crear los symlinks necesarios:

   ```sh
   cd ~/dotfiles
   stow -t ~ nvim
   stow -t ~ zsh
   stow -t ~ tmux
   ```

Cada paquete puede aplicarse de manera independiente.

---

## 📝 Notas importantes

* Si un archivo ya existe en el sistema (por ejemplo `~/.zshrc`), Stow no lo sobrescribirá.
  Deberás renombrarlo o respaldarlo primero.

* Puedes combinar este repositorio con herramientas como **chezmoi**, **yadm** o scripts de bootstrap si más adelante quieres automatizar todo.

---

## 📬 Contacto / Comentarios

Cualquier mejora, sugerencia o corrección es bienvenida mediante un issue o PR.

¡Disfruta de tu entorno de desarrollo sincronizado y organizado! 🙌

