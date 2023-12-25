const { app, BrowserWindow } = require('electron');

function createWindow() {
    // Get the port number from the command line arguments or default to 3001
    const port = process.argv[2] || '3001';

    const win = new BrowserWindow({
        width: 800,
        height: 600,
        frame: false,
        webPreferences: {
            nodeIntegration: false,
            contextIsolation: true
        }
    });

    // Use the provided port number in the URL
    win.loadURL(`https://localhost:${port}`);

    win.maximize();
    win.setFullScreen(true);
}

app.whenReady().then(createWindow);

app.on('certificate-error', (event, webContents, url, error, certificate, callback) => {
    // Bypass the certificate error for now
    event.preventDefault();
    callback(true);
});

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
});

app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
        createWindow();
    }
});
