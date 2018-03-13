function My_factorial=FactorialFun(e)
f=0;
My_factorial=[];
if e>0
    for o=1:e
        f=f+log(o);
        My_factorial=[My_factorial f];
    end
end
end