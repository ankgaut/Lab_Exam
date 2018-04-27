######################## Step 1
n_train = 10000
n_test = 1000
eta = 0.00000001

A = dlmread("train.csv",SEP=',',R0=1,C0=0);

size(A)

x_train = A(:,1)
size(x_train)

y_train = A(:,2)
size(y_train)

tmp = x_train'
o = ones(1,n_train)
temp = [ o ; tmp ] 
x_train_new = temp'

size(x_train_new) 

########################### Step 2
w = rand(2,1)  #### 
size(w) 

########################### Step 3
x_dash = x_train_new

plot(x_train, y_train);
#plot(x_train, y_train,"bo");
hold on;

title("Plot of Step 3");

new = (w')*(x_dash')

plot(x_train,new,"r")
pause(1);
print -dpdf "fig1.pdf";
close

########################### Step 4
i = inv((x_train_new')*x_train_new)
w_direct = i*(x_train_new')*y_train
size(w_direct)

disp(w_direct)

#plot(x_train, y_train,"bo");
plot(x_train, y_train);
hold on;
title("Plot of Step 4");


new = (w_direct')*(x_train_new')

plot(x_train,new,"r")
pause(1);
print -dpdf "fig2.pdf";
close

############################ Step 5
for nepoch=1:1,
  for j=1:n_train,

    x = x_train(j)
    y = y_train(j)

    new_x = [1 x]'
    w = w - eta*( (w')*new_x - y)*new_x

    if( rem(j,1000) == 0),

      #plot(x_train, y_train,"bo");
      plot(x_train, y_train)
      hold on;

      title("Plot of Step 5");

      new = (w')*(x_dash')

      plot(x_train,new,"r")
      pause(1);
      print -dpdf "fig3.pdf";
      close
      
    end,
  end,
end,


########################### Step 6
#plot(x_train, y_train,"bo");
plot(x_train, y_train);
hold on;

title("Plot of Step 6.1");

new = (w')*(x_dash')

plot(x_train,new,"r")
pause(5);
print -dpdf "fig4.pdf";
close


plot(x_train, y_train);
hold on;
title("Plot of Step 6.2");

new = (w')*(x_train_new')

plot(x_train,new,"r")
pause(1);
print -dpdf "fig5.pdf";
close

############################## Step 7
R = dlmread("test.csv",SEP=',',R0=1,C0=0);
size(R)

x_test = R(1:n_test,1)
y_test = R(1:n_test,2)

tmp = x_test'
o = ones(1,n_test)
x_test_new = [o;tmp]'

w
w_direct
y_pred1 = x_test_new*w
y_pred2 = x_test_new*w_direct

val1 = 0 
val2 = 0

for i=1:n_test,

  p = y_test(i) - y_pred1(i)
  p = p * p 
  
  q = y_test(i) - y_pred2(i)
  q = q * q
  
  val1 = val1 + p
  val2 = val2 + q
  

end,

val1 = val1 / n_test
val2 = val2 / n_test

rms_val_1 = sqrt(val1)
rms_val_2 = sqrt(val2)
rms_val_1
rms_val_2
