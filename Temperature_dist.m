function Temperature_dist(w,Nx,Tinit,TL,TR,TB,TT)
%height and node distrubution of the square domain
h=w;
Ny=Nx;

%geometry of element of domain in x and y respectively
dx=w/(Nx-1);
dy=h/(Ny-1);

%initail temperature and array creation
T= Tinit*ones(Nx,Ny);%initail temperature and array creation

%WALL BOUNDARY CONDITIONS
T(1,2:Ny-1)=TL;
T(2:Nx-1,1)=TB;
T(Nx,2:Ny-1)=TR;
T(2:Nx-1,Ny)=TT;

%TEMPERATURE FOR THE CORNER POINTS
T(1,1)=(TL+TB)/2;
T(Nx,1)=(TR+TB)/2;
T(1,Ny)=(TL+TT)/2;
T(Nx,Ny)=(TT+TR)/2;

%CALCULATION
epsilon=1e-3;%error limit
error=5;%initial random error

iter=0;
while(error>epsilon)
iter=iter+1;
Told=T;
for j=2:Ny-1
    for i=2:Nx-1
        T(i,j)=(T(i+1,j)+T(i,j+1)+T(i-1,j)+T(i,j-1))/4; %using centered finite differnce method
    end
end
error=sqrt(sumsqr(T-Told));
end

%plotting the graph
x=0:dx:w;
y=0:dy:h;
colormap('jet');%to have a temperature distrubution idea with colour
contourf(x,y,T');%ploting the graphical representation
%label the final output to have brief idea on the graph.
title('Temperature Distrubution on square plate');
xlabel('Width in (m)');
ylabel('Height in (m)');
colorbar









