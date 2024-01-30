    %% Datos del canal: 
    ChannelIDMovilCam = 1012384;
    readAPIKeyMovilCam = '9TI4K11SPDSQVZQ0';
    writeAPIKeyMovilCam = '8F4OQAMY9AUSUDTS';
    
    %% Leer canal en Camara Movil para activarlo
    ObjetoDetectado = 0;
    thingSpeakWrite(ChannelIDMovilCam,ObjetoDetectado,'Writekey',writeAPIKeyMovilCam);
    % Hay que esperar 15 segundos para dar tiempo a la escritura. 
    pause(2); %S�lo se ademiten esperas de 2 segundos
    pause(2); pause(2); pause(2); pause(2); pause(2); pause(2); pause(2); 
    
    %% captura de la imagen modo: manual o innmediato
    img = snapshot(camara,'manual');
    %img = snapshot(camara,'immediate');
    
    %img = imread('pekines.jpg'); % opci�n para leer la imagen desde fichero 
    
    % redimensionar la imagen al tama�o requerido por AlexNet
    imagen = imresize(img,[227,227]);
    
    % Clasificaci�n de la imagen capturada
    etiqueta = classify(RedAlex,imagen)
    
    % Visualizaci�n de la imagen
    image(imagen)
    title(char(etiqueta))
    
    %% Si se detecta el objeto buscado, lanzar mensaje por Twitter v�a ThingSpeak 
     if  etiqueta == 'Pekinese'
       ObjetoDetectado = 1;
       thingSpeakWrite(ChannelIDMovilCam,ObjetoDetectado,'Writekey',writeAPIKeyMovilCam);
    end
