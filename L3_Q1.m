close, clear, clc;
a = 0.01;
b = 2;

am = 0.1;
bm = 0.1;

a0_hat = 0.02;
b0_hat = 1;

K0 = -log(0.01)/0.5;
ax0_hat = (a0_hat - am) / b0_hat;
av0_hat = bm / b0_hat;
gamma = 0.1;

ax_str = (a - am) / b;
av_str = bm / b;

T_ref = 2;
tf = 300;
t_step = 1e-3;
sim('L3_Q1_Sim.slx');

figure(1), set(gcf,'color','w');
plot(t,r,'k','LineWidth',2), hold on, plot(t,xm,'r',t,x,'b'), hold off;
grid on, xlabel('Time (s)'), ylabel('Ouput amplitude');
legend('Reference','Model','Plant'), title('MRAC tracking - Model x Plant');

figure(2), set(gcf,'color','w');
plot(t,r,'k','LineWidth',2), hold on, plot(t,xm,'r',t,x,'b'), hold off;
grid on, xlabel('Time (s)'), ylabel('Ouput amplitude'), xlim([tf-10,tf]);
legend('Reference','Model','Plant'), title('MRAC tracking - Model x Plant - END');

figure(3), set(gcf,'color','w');
plot(t,ax_hat,'k'), hold on, plot([t(1),t(end)],[ax_str,ax_str],'g');
plot(t,av_hat,'r'), plot([t(1),t(end)],[av_str,av_str],'b'), hold off, grid on;
xlabel('Time (s)'), ylabel('Parameters values'), title('Parameters update');
legend({'$\hat{a}_{x}$','$a^{*}_{x}$','$\hat{a}_{v}$','$a^{*}_{v}$'},...
    'Interpreter','latex','FontSize',14);