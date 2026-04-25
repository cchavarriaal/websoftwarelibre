import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class NotificationService {
  private createPopup(title: string, message: string, type: 'success' | 'error' | 'confirm' | 'info'): Promise<boolean> {
    return new Promise((resolve) => {
      const overlay = document.createElement('div');
      overlay.style.cssText = 'position:fixed;top:0;left:0;width:100vw;height:100vh;background:rgba(0,0,0,0.6);backdrop-filter:blur(4px);z-index:9999;display:flex;align-items:center;justify-content:center;opacity:0;transition:opacity 0.2s;';
      
      const modal = document.createElement('div');
      modal.style.cssText = 'background:#151e32;border:1px solid rgba(255,255,255,0.1);border-radius:12px;padding:2rem;min-width:320px;max-width:400px;text-align:center;box-shadow:0 20px 40px rgba(0,0,0,0.5);transform:scale(0.9);transition:transform 0.2s;';
      
      const icon = document.createElement('div');
      icon.style.cssText = 'font-size:3rem;margin-bottom:1rem;';
      icon.innerHTML = type === 'success' ? '✅' : (type === 'error' ? '❌' : (type === 'confirm' ? '⚠️' : 'ℹ️'));

      const titleEl = document.createElement('h2');
      titleEl.style.cssText = 'color:#fff;margin:0 0 0.5rem;font-size:1.5rem;';
      titleEl.innerText = title;

      const msgEl = document.createElement('p');
      msgEl.style.cssText = 'color:#a0aec0;margin:0 0 2rem;font-size:1rem;';
      msgEl.innerText = message;

      const actions = document.createElement('div');
      actions.style.cssText = 'display:flex;justify-content:center;gap:1rem;';

      const close = () => {
        overlay.style.opacity = '0';
        modal.style.transform = 'scale(0.9)';
        setTimeout(() => document.body.removeChild(overlay), 200);
      };

      if (type === 'confirm') {
        const btnCancel = document.createElement('button');
        btnCancel.innerText = 'Cancelar';
        btnCancel.style.cssText = 'padding:0.6rem 1.2rem;border-radius:6px;border:none;background:rgba(255,255,255,0.1);color:#fff;cursor:pointer;font-weight:600;';
        btnCancel.onclick = () => { close(); resolve(false); };
        
        const btnOk = document.createElement('button');
        btnOk.innerText = 'Confirmar';
        btnOk.style.cssText = 'padding:0.6rem 1.2rem;border-radius:6px;border:none;background:#ef4444;color:#fff;cursor:pointer;font-weight:600;';
        btnOk.onclick = () => { close(); resolve(true); };

        actions.appendChild(btnCancel);
        actions.appendChild(btnOk);
      } else {
        const btnOk = document.createElement('button');
        btnOk.innerText = 'Aceptar';
        btnOk.style.cssText = `padding:0.6rem 1.2rem;border-radius:6px;border:none;background:${type === 'info' ? '#3b82f6' : '#00e5ff'};color:${type === 'info' ? '#fff' : '#0b1121'};cursor:pointer;font-weight:600;`;
        btnOk.onclick = () => { close(); resolve(true); };
        actions.appendChild(btnOk);
      }

      modal.appendChild(icon);
      modal.appendChild(titleEl);
      modal.appendChild(msgEl);
      modal.appendChild(actions);
      overlay.appendChild(modal);
      document.body.appendChild(overlay);

      setTimeout(() => {
        overlay.style.opacity = '1';
        modal.style.transform = 'scale(1)';
      }, 10);
    });
  }

  success(title: string, message: string) {
    return this.createPopup(title, message, 'success');
  }
  error(title: string, message: string) {
    return this.createPopup(title, message, 'error');
  }
  confirm(title: string, message: string) {
    return this.createPopup(title, message, 'confirm');
  }
  info(title: string, message: string) {
    return this.createPopup(title, message, 'info');
  }
}
