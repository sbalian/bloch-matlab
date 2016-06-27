function plotbloch
%PLOTBLOCH Plots a Bloch sphere.
%
% Seto Balian. Created Oct 14 2015. v.0.1.

% Choose color map
colormap winter

% Plot the sphere
[x,y,z] = sphere(128);
h = surfl(x, y, z,'cdata');
set(h, 'FaceAlpha', 0.08)
set(gcf,'Color','w');
shading interp
axis square
hold on

% Plot axes
line([-1 1],[0 0],[0 0],'color','k');
line([0 0],[-1 1],[0 0],'color','k');
line([0 0],[0 0],[-1 1],'color','k');

% Plot isolines
gray = [1 1 1]*96/255;
circle_phis = [22.5 45.0 -22.5 -45.0];
circle_phis = (pi/180.0)*(circle_phis);

for i=1:length(circle_phis)
    [x,y,z] = sph2cart(linspace(0, 2*pi, 100), ...
        linspace(circle_phis(i), circle_phis(i), 100), linspace(1,1,100));
    plot3(x,y,z,'LineStyle',':','Color',gray);
end
[x,y,z] = sph2cart(linspace(0, 2*pi, 100), linspace(0.0, 0.0, 100), linspace(1,1,100));
plot3(x,y,z,'color',gray);

grid off

% Label axes
text(1.2,0,0,'X','fontsize',12)
text(0,1.2,0,'Y','fontsize',12)
text(0,0,1.2,'Z','fontsize',12)
text(-1.2,0,0,'-X','fontsize',12)
text(0,-1.2,0,'-Y','fontsize',12)
text(0,0,-1.2,'-Z','fontsize',12)

xlabel X
ylabel Y
zlabel Z

% Set view angle
view (-220,20)

hold off

end

