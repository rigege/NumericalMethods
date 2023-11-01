A = load('A.txt');
B = load('B.txt');

C = A;
for x = 1:height(A)
    C(x,width(A)+1) = B(x);
end

for startind = 1:height(C)-1

    maxrow = 1;
    for q = startind:height(C)
        if (abs(C(q,startind)) > abs(C(startind)))
            maxrow = q;
        end
    end

    C([startind maxrow],:) = C([maxrow startind],:);
    for w = startind+1:height(C)
        if (C(w,startind) ~= 0)
            C(w,:) = C(w,:)*C(startind,startind)/C(w,startind) - C(startind,:);
        end
        
    end
end

for e = 1:height(C)
    redrow = height(C) + 1 - e;
    C(redrow,:) = C(redrow,:)/C(redrow,redrow);
    
    vars = C(:,width(C));

    if (redrow ~= height(C))
        toadd = 0;
        for r = redrow+1:height(C)
            toadd = toadd - C(redrow,r)*vars(r);
        end        
        C(redrow, width(C)) = C(redrow, width(C)) + toadd;
    end
end
vars(1) = C(1, width(C))


