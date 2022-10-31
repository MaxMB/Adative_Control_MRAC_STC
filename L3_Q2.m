close, clear, clc;
a = 0.01;
b = 2;

a0_hat = 0.02;
b0_hat = 1;

K0 = -log(0.01)/0.5;
alpha = 10;
lf = 3;

T_ref = 2;
tf = 20;
t_step = 1e-3;
sim('L3_Q2_Sim.slx');

figure(1), set(gcf,'color','w');
plot(t,r,'k','LineWidth',2), hold on, plot(t,x,'r'), hold off;
grid on, xlabel('Time (s)'), ylabel('Ouput amplitude');
legend('Reference','Plant'), title('STC tracking - Plant');

figure(2), set(gcf,'color','w');
plot([t(1),t(end)],[a,a],'g'), hold on, plot(t,a_hat,'k');
plot([t(1),t(end)],[b,b],'b'), plot(t,b_hat,'r'), hold off, grid on;
xlabel('Time (s)'), ylabel('Parameters values'), title('Parameters update');
legend({'$\hat{a}$','a','$\hat{b}$','b'},'Interpreter','latex','FontSize',14);