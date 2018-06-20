% carrega o arquivo fis que tem a lógica fuzzy
load_file = readfis('rule4.fis');

% declarando a api do vrep
vrep=remApi('remoteApi');
vrep.simxFinish(-1);

%vetor de distancias e de controle dos sensores
sensorHandle = [0, 0, 0];
dist = [0, 0, 0];

%conectando ao Vrep
clientID=vrep.simxStart('127.0.0.1',19997,true,true,5000,5);

 if (clientID>-1)
     disp('Connected')
     % Handle dos motores e sensores
     [returnCode,left_Motor]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_leftMotor',vrep.simx_opmode_blocking);
     [returnCode,right_Motor]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_rightMotor',vrep.simx_opmode_blocking);
     [returnCode,sensorHandle(1)]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor1',vrep.simx_opmode_blocking);
     [returnCode,sensorHandle(2)]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor2',vrep.simx_opmode_blocking);
     [returnCode,sensorHandle(3)]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor3',vrep.simx_opmode_blocking);
     disp('sensores conectados');
     
     
     % handle sensors
     while(1)
         for i = 1:1:3
             % read sensors
             [returnCode,detectionState,detectedPoint,~,~]=vrep.simxReadProximitySensor(clientID,sensorHandle(i),vrep.simx_opmode_streaming);
             if(detectionState)
                 if(norm(detectedPoint) > 2)
                    dist(i) = 2;
                 else
                    dist(i) = norm(detectedPoint);
                 end
                 
             else
                 dist(i) = 2;
             end   
         end
         %disp(dist);
         
         % chama o fis para receber a velocidades das rodas dada as
         % distâncias
         s = evalfis([dist(1) dist(2) dist(3)], load_file);
         disp('velocidades');
         disp(s);
         disp('distancias');
         disp(dist);
         
         % change velocity 
         [returnCode]=vrep.simxSetJointTargetVelocity( clientID, left_Motor, s(1),vrep.simx_opmode_blocking);
         [returnCode]=vrep.simxSetJointTargetVelocity( clientID, right_Motor, s(2),vrep.simx_opmode_blocking);


     end
     % fecha a conexão com o vrep
     vrep.simxFinish(-1);
     
 end
 vrep.delete();
 
 
     