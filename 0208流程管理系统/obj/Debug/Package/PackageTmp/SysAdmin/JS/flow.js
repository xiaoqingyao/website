eval(function (p, a, c, k, e, r) { e = function (c) { return (c < 62 ? '' : e(parseInt(c / 62))) + ((c = c % 62) > 35 ? String.fromCharCode(c + 29) : c.toString(36)) }; if ('0'.replace(0, e) == 0) { while (c--) r[e(c)] = k[c]; k = [function (e) { return r[e] || e } ]; e = function () { return '([689U-Z]|[1-3]\\w)' }; c = 1 }; while (c--) if (k[c]) p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]); return p } ('(8(b){9 a={};a.16={1w:1x,1Y:15,2R:"",19:{6:{x:10,y:10,V:50,X:25,r:5,1p:"90-#1y-#C0C0C0",1a:"#1r","1a-V":1},2S:"2k&Y",1z:"2l",1B:{Y:"2l","2T-2U":"italic"},Y:{Y:"状态","2T-size":13},1G:5,1h:[],1l:{}},17:{6:{17:{17:"2V 10L100 2W",1a:"#2x",1p:"2X","1a-V":2},1K:{17:"2V 10L10 10",1a:"#2x",1p:"#2x","1a-V":2,2Y:4},1H:{V:5,X:5,1a:"#1y",1p:"#1r",1A:"2a","1a-V":2},1I:{V:5,X:5,1a:"#1y",1p:"#1r",1A:"2a","1a-V":2},1L:{V:5,X:5,1a:"#1y",1p:"#1r",1A:"2a","1a-V":2},1M:{V:5,X:5,1a:"#1y",1p:"#1r",1A:"2a","1a-V":3}},Y:{Y:"TO {to}",1A:"2a",2b:"#1r"},2y:{x:0,y:-10},1h:{Y:{1B:"Y",2Z:"显示",1N:"",1Z:8(){Z 1C a.31.32()}}}},2c:{6:{18:10,2z:10},2A:{},17:{},1O:{},33:{34:8(c){35.36({37:2m.38(\'myflow_SaveTB\'),39:\'新建流程\',2b:\'#aaa\',1U:0.7,3a:1x})}}},1h:{6:{2z:10,11:30},1h:{}},1P:"",3b:{1i:[],2B:{1a:"#ff0000","1a-V":2}},3c:{1i:[],2C:{17:{1a:"#2D"},1K:{1a:"#2D",1p:"#2D"}}}};a.1j={2E:8(g,f,e){9 d,c;U((g.x-e.x)==0){d=1}1q{d=(g.y-e.y)/(g.x-e.x)}c=(f.x-e.x)*d+e.y;U((f.y-c)<10&&(f.y-c)>-10){f.y=c;Z 1x}Z 2n},20:8(d,c){Z{x:(d.x-c.x)/2+c.x,y:(d.y-c.y)/2+c.y}},2F:(8(){9 c=0;Z 8(){Z++c}})(),1Q:8(j,d){9 c=d,e={x:j.x+j.V/2,y:j.y+j.X/2};9 l=(e.y-c.y)/(e.x-c.x);l=isNaN(l)?0:l;9 k=j.X/j.V;9 h=c.y<e.y?-1:1,f=c.x<e.x?-1:1,g,i;U(1b.2o(l)>k&&h==-1){g=e.y-j.X/2;i=e.x+h*j.X/2/l}1q{U(1b.2o(l)>k&&h==1){g=e.y+j.X/2;i=e.x+h*j.X/2/l}1q{U(1b.2o(l)<k&&f==-1){g=e.y+f*j.V/2*l;i=e.x-j.V/2}1q{U(1b.2o(l)<k&&f==1){g=e.y+j.V/2*l;i=e.x+j.V/2}}}}Z{x:i,y:g}},1K:8(l,k,d){9 g=1b.atan2(l.y-k.y,k.x-l.x)*(21/1b.PI);9 h=k.x-d*1b.2G(g*(1b.PI/21));9 f=k.y+d*1b.2H(g*(1b.PI/21));9 e=h+d*1b.2G((g+3d)*(1b.PI/21));9 j=f-d*1b.2H((g+3d)*(1b.PI/21));9 c=h+d*1b.2G((g+3e)*(1b.PI/21));9 i=f-d*1b.2H((g+3e)*(1b.PI/21));Z[k,{x:e,y:j},{x:c,y:i}]}};a.19=8(p,m){9 u=W,g="19"+a.1j.2F(),E=b.1R(1x,{},a.16.19,p),C=m,t,e,n,f,x,v;t=C.19(E.6.x,E.6.y,E.6.V,E.6.X,E.6.r).1f().6(E.6);e=C.2k(a.16.2R+E.1l.3f,E.6.x+E.1l.V/2,E.6.y+(E.6.X-E.1l.X)/2,E.1l.V,E.1l.X).1f();n=C.Y(E.6.x+E.1l.V+(E.6.V-E.1l.V)/2,E.6.y+a.16.1Y/2,E.1B.Y).1f().6(E.1B);f=C.Y(E.6.x+E.1l.V+(E.6.V-E.1l.V)/2,E.6.y+(E.6.X-a.16.1Y)/2+a.16.1Y,E.Y.Y).1f().6(E.Y);t.1t(8(r,o){A(r,o)},8(){z()},8(){l()});e.1t(8(r,o){A(r,o)},8(){z()},8(){l()});n.1t(8(r,o){A(r,o)},8(){z()},8(){l()});f.1t(8(r,o){A(r,o)},8(){z()},8(){l()});9 A=8(F,r){U(!a.16.1w){Z}9 o=(x+F);9 G=(v+r);q.x=o-E.1G;q.y=G-E.1G;B()};9 z=8(){x=t.6("x");v=t.6("y");t.6({1U:0.5});e.6({1U:0.5});f.6({1U:0.5})};9 l=8(){t.6({1U:1});e.6({1U:1});f.6({1U:1})};9 s,i={},h=5,q={x:E.6.x-E.1G,y:E.6.y-E.1G,V:E.6.V+E.1G*2,X:E.6.X+E.1G*2};s=C.17("M0 0L1 1").1f();i.t=C.19(0,0,h,h).6({1p:"#1r",1a:"#1y",1A:"s-1V"}).1f().1t(8(r,o){D(r,o,"t")},8(){k(W.6("x")+h/2,W.6("y")+h/2,"t")},8(){});i.lt=C.19(0,0,h,h).6({1p:"#1r",1a:"#1y",1A:"nw-1V"}).1f().1t(8(r,o){D(r,o,"lt")},8(){k(W.6("x")+h/2,W.6("y")+h/2,"lt")},8(){});i.l=C.19(0,0,h,h).6({1p:"#1r",1a:"#1y",1A:"w-1V"}).1f().1t(8(r,o){D(r,o,"l")},8(){k(W.6("x")+h/2,W.6("y")+h/2,"l")},8(){});i.lb=C.19(0,0,h,h).6({1p:"#1r",1a:"#1y",1A:"sw-1V"}).1f().1t(8(r,o){D(r,o,"lb")},8(){k(W.6("x")+h/2,W.6("y")+h/2,"lb")},8(){});i.b=C.19(0,0,h,h).6({1p:"#1r",1a:"#1y",1A:"s-1V"}).1f().1t(8(r,o){D(r,o,"b")},8(){k(W.6("x")+h/2,W.6("y")+h/2,"b")},8(){});i.rb=C.19(0,0,h,h).6({1p:"#1r",1a:"#1y",1A:"se-1V"}).1f().1t(8(r,o){D(r,o,"rb")},8(){k(W.6("x")+h/2,W.6("y")+h/2,"rb")},8(){});i.r=C.19(0,0,h,h).6({1p:"#1r",1a:"#1y",1A:"w-1V"}).1f().1t(8(r,o){D(r,o,"r")},8(){k(W.6("x")+h/2,W.6("y")+h/2,"r")},8(){});i.rt=C.19(0,0,h,h).6({1p:"#1r",1a:"#1y",1A:"ne-1V"}).1f().1t(8(r,o){D(r,o,"rt")},8(){k(W.6("x")+h/2,W.6("y")+h/2,"rt")},8(){});9 D=8(F,r,G){U(!a.16.1w){Z}9 o=3g+F,H=3h+r;24(G){1d"t":q.X+=q.y-H;q.y=H;1e;1d"lt":q.V+=q.x-o;q.X+=q.y-H;q.x=o;q.y=H;1e;1d"l":q.V+=q.x-o;q.x=o;1e;1d"lb":q.X=H-q.y;q.V+=q.x-o;q.x=o;1e;1d"b":q.X=H-q.y;1e;1d"rb":q.X=H-q.y;q.V=o-q.x;1e;1d"r":q.V=o-q.x;1e;1d"rt":q.V=o-q.x;q.X+=q.y-H;q.y=H;1e}B()};9 k=8(r,o,F){3g=r;3h=o};b([t.1S,f.1S,n.1S,e.1S]).1u("1T",8(){U(!a.16.1w){Z}w();9 o=b(C).1J("2p");24(o){1d"2A":1e;1d"17":9 r=b(C).1J("2h");U(r&&r.14()!=g&&r.14().1m(0,4)=="19"){b(C).1D("3i",[r,u])}1e}b(C).1D("1T",u);b(C).1J("2h",u);Z 2n});9 j=8(o,r){U(!a.16.1w){Z}U(r.14()==g){b(C).1D("2I",[E.1h,r])}1q{d()}};b(C).1u("1T",j);9 c=8(o,F,r){U(r.14()==g){f.6({Y:F})}};b(C).1u("2i",c);8 y(){Z"M"+q.x+" "+q.y+"L"+q.x+" "+(q.y+q.X)+"L"+(q.x+q.V)+" "+(q.y+q.X)+"L"+(q.x+q.V)+" "+q.y+"L"+q.x+" "+q.y}8 w(){s.1E();1n(9 o in i){i[o].1E()}}8 d(){s.1f();1n(9 o in i){i[o].1f()}}8 B(){9 F=q.x+E.1G,r=q.y+E.1G,G=q.V-E.1G*2,o=q.X-E.1G*2;t.6({x:F,y:r,V:G,X:o});24(E.2S){1d"2k":e.6({x:F+(G-E.1l.V)/2,y:r+(o-E.1l.X)/2}).1E();1e;1d"Y":t.1E();f.6({x:F+G/2,y:r+o/2}).1E();1e;1d"2k&Y":t.1E();n.6({x:F+E.1l.V+(G-E.1l.V)/2,y:r+a.16.1Y/2}).1E();f.6({x:F+E.1l.V+(G-E.1l.V)/2,y:r+(o-a.16.1Y)/2+a.16.1Y}).1E();e.6({x:F+E.1l.V/2,y:r+(o-E.1l.X)/2}).1E();1e}i.t.6({x:q.x+q.V/2-h/2,y:q.y-h/2});i.lt.6({x:q.x-h/2,y:q.y-h/2});i.l.6({x:q.x-h/2,y:q.y-h/2+q.X/2});i.lb.6({x:q.x-h/2,y:q.y-h/2+q.X});i.b.6({x:q.x-h/2+q.V/2,y:q.y-h/2+q.X});i.rb.6({x:q.x-h/2+q.V,y:q.y-h/2+q.X});i.r.6({x:q.x-h/2+q.V,y:q.y-h/2+q.X/2});i.rt.6({x:q.x-h/2+q.V,y:q.y-h/2});s.6({17:y()});b(C).1D("2J",u)}W.26=8(){9 r="{1z:\'"+E.1z+"\',Y:{Y:\'"+f.6("Y")+"\'}, 6:{ x:"+1b.1W(t.6("x"))+", y:"+1b.1W(t.6("y"))+", V:"+1b.1W(t.6("V"))+", X:"+1b.1W(t.6("X"))+"}, 1h:{";1n(9 o in E.1h){r+=o+":{1N:\'"+E.1h[o].1N+"\'},"}U(r.1m(r.1c-1,r.1c)==","){r=r.1m(0,r.1c-1)}r+="}}";Z r};W.1P=8(o){9 r=o;E=b.1R(1x,E,o);f.6({Y:r.Y.Y});B()};W.1o=8(){Z q};W.14=8(){Z g};W.1g=8(){t.1g();f.1g();n.1g();e.1g();s.1g();1n(9 o in i){i[o].1g()}};W.Y=8(){Z f.6("Y")};W.6=8(o){U(o){t.6(o)}};B()};a.17=8(q,n,u,e){9 v=W,z=n,B=b.1R(1x,{},a.16.17),i,t,f,h=B.2y,y,w,k=u,s=e,g="17"+a.1j.2F(),x;8 p(G,H,D,L){9 F=W,M=G,r,o=D,O=L,K,I,N=H;24(M){1d"1v":r=z.19(H.x-B.6.1H.V/2,H.y-B.6.1H.X/2,B.6.1H.V,B.6.1H.X).6(B.6.1H);1e;1d"27":r=z.19(H.x-B.6.1L.V/2,H.y-B.6.1L.X/2,B.6.1L.V,B.6.1L.X).6(B.6.1L);1e;1d"1X":r=z.19(H.x-B.6.1M.V/2,H.y-B.6.1M.X/2,B.6.1M.V,B.6.1M.X).6(B.6.1M);1e;1d"to":r=z.19(H.x-B.6.1I.V/2,H.y-B.6.1I.X/2,B.6.1I.V,B.6.1I.X).6(B.6.1I);1e}U(r&&(M=="27"||M=="1X")){r.1t(8(Q,P){C(Q,P)},8(){J()},8(){E()});9 C=8(R,Q){9 P=(K+R),S=(I+Q);F.28(P,S)};9 J=8(){U(M=="27"){K=r.6("x")+B.6.1L.V/2;I=r.6("y")+B.6.1L.X/2}U(M=="1X"){K=r.6("x")+B.6.1M.V/2;I=r.6("y")+B.6.1M.X/2}};9 E=8(){}}W.1z=8(P){U(P){M=P}1q{Z M}};W.1S=8(P){U(P){r=P}1q{Z r}};W.18=8(P){U(P){o=P}1q{Z o}};W.11=8(P){U(P){O=P}1q{Z O}};W.1g=8(){o=23;O=23;r.1g()};W.12=8(P){U(P){N=P;r.6({x:N.x-r.6("V")/2,y:N.y-r.6("X")/2});Z W}1q{Z N}};W.28=8(Q,T){W.12({x:Q,y:T});24(M){1d"1v":U(O&&O.11()&&O.11().1z()=="to"){O.11().12(a.1j.1Q(s.1o(),N))}U(O&&O.11()){O.12(a.1j.20(N,O.11().12()))}1e;1d"27":U(O&&O.11()&&O.11().1z()=="to"){O.11().12(a.1j.1Q(s.1o(),N))}U(o&&o.18()&&o.18().1z()=="1v"){o.18().12(a.1j.1Q(k.1o(),N))}U(O&&O.11()){O.12(a.1j.20(N,O.11().12()))}U(o&&o.18()){o.12(a.1j.20(N,o.18().12()))}9 S={x:N.x,y:N.y};U(a.1j.2E(o.18().12(),S,O.11().12())){M="1X";r.6(B.6.1M);W.12(S);9 P=o;o.18().11(o.11());o=o.18();P.1g();9 R=O;O.11().18(O.18());O=O.11();R.1g()}1e;1d"1X":U(o&&O&&!a.1j.2E(o.12(),{x:N.x,y:N.y},O.12())){M="27";r.6(B.6.1L);9 P=1C p("1X",a.1j.20(o.12(),N),o,o.11());o.11(P);o=P;9 R=1C p("1X",a.1j.20(O.12(),N),O.18(),O);O.18(R);O=R}1e;1d"to":U(o&&o.18()&&o.18().1z()=="1v"){o.18().12(a.1j.1Q(k.1o(),N))}U(o&&o.18()){o.12(a.1j.20(N,o.18().12()))}1e}m()}}8 j(){9 D,C,E=k.1o(),F=s.1o(),r,o;r=a.1j.1Q(E,{x:F.x+F.V/2,y:F.y+F.X/2});o=a.1j.1Q(F,r);D=1C p("1v",r,23,1C p("1X",{x:(r.x+o.x)/2,y:(r.y+o.y)/2}));D.11().18(D);C=1C p("to",o,D.11(),23);D.11().11(C);W.3j=8(){U(!D){Z""}9 J=D,I="M"+J.12().x+" "+J.12().y,H="";29(J.11()){J=J.11();I+="L"+J.12().x+" "+J.12().y}9 G=a.1j.1K(J.18().12(),J.12(),B.6.1K.2Y);H="M"+G[0].x+" "+G[0].y+"L"+G[1].x+" "+G[1].y+"L"+G[2].x+" "+G[2].y+"z";Z[I,H]};W.26=8(){9 G="[",H=D;29(H){U(H.1z()=="27"){G+="{x:"+1b.1W(H.12().x)+",y:"+1b.1W(H.12().y)+"},"}H=H.11()}U(G.1m(G.1c-1,G.1c)==","){G=G.1m(0,G.1c-1)}G+="]";Z G};W.1P=8(H){9 I=H,J=D.11();1n(9 G=0;G<I.1c;G++){J.28(I[G].x,I[G].y);J.28(I[G].x,I[G].y);J=J.11()}W.1f()};W.1H=8(){Z D};W.1I=8(){Z C};W.2K=8(){9 H=D.11(),G=D.11().11();29(G.11()&&G.11().11()){G=G.11().11();H=H.11()}Z H};W.1E=8(){9 G=D;29(G){G.1S().1E();G=G.11()}};W.1f=8(){9 G=D;29(G){G.1S().1f();G=G.11()}};W.1g=8(){9 G=D;29(G){U(G.11()){G=G.11();G.18().1g()}1q{G.1g();G=23}}}}B=b.1R(1x,B,q);i=z.17(B.6.17.17).6(B.6.17);t=z.17(B.6.1K.17).6(B.6.1K);x=1C j();x.1f();f=z.Y(0,0,B.Y.Y).6(B.Y).6({Y:B.Y.Y.3k("{1v}",k.Y()).3k("{to}",s.Y())});f.1t(8(r,o){U(!a.16.1w){Z}f.6({x:y+r,y:w+o})},8(){y=f.6("x");w=f.6("y")},8(){9 o=x.2K().12();h={x:f.6("x")-o.x,y:f.6("y")-o.y}});m();b([i.1S,t.1S]).1u("1T",8(){U(!a.16.1w){Z}b(z).1D("1T",v);b(z).1J("2h",v);Z 2n});9 l=8(r,C){U(!a.16.1w){Z}U(C&&C.14()==g){x.1E();b(z).1D("2I",[B.1h,v])}1q{x.1f()}9 o=b(z).1J("2p");24(o){1d"2A":1e;1d"17":1e}};b(z).1u("1T",l);9 A=8(o,r){U(!a.16.1w){Z}U(r&&(r.14()==k.14()||r.14()==s.14())){b(z).1D("2L",v)}};b(z).1u("2q",A);9 d=8(C,D){U(!a.16.1w){Z}U(k&&k.14()==D.14()){9 o;U(x.1H().11().11().1z()=="to"){o={x:s.1o().x+s.1o().V/2,y:s.1o().y+s.1o().X/2}}1q{o=x.1H().11().11().12()}9 r=a.1j.1Q(k.1o(),o);x.1H().28(r.x,r.y);m()}U(s&&s.14()==D.14()){9 o;U(x.1I().18().18().1z()=="1v"){o={x:k.1o().x+k.1o().V/2,y:k.1o().y+k.1o().X/2}}1q{o=x.1I().18().18().12()}9 r=a.1j.1Q(s.1o(),o);x.1I().28(r.x,r.y);m()}};b(z).1u("2J",d);9 c=8(r,o,C){U(C.14()==g){f.6({Y:o})}};b(z).1u("2i",c);W.1v=8(){Z k};W.to=8(){Z s};W.26=8(){9 r="{1v:\'"+k.14()+"\',to:\'"+s.14()+"\', 3l:"+x.26()+",Y:{Y:\'"+f.6("Y")+"\'},2y:{x:"+1b.1W(h.x)+",y:"+1b.1W(h.y)+"}, 1h:{";1n(9 o in B.1h){r+=o+":{1N:\'"+B.1h[o].1N+"\'},"}U(r.1m(r.1c-1,r.1c)==","){r=r.1m(0,r.1c-1)}r+="}}";Z r};W.1P=8(o){9 r=o;B=b.1R(1x,B,o);x.1P(r.3l)};W.1g=8(){x.1g();i.1g();t.1g();f.1g();2r{b(z).2s("1T",l)}2t(o){}2r{b(z).2s("2q",A)}2t(o){}2r{b(z).2s("2J",d)}2t(o){}2r{b(z).2s("2i",c)}2t(o){}};8 m(){9 r=x.3j(),o=x.2K().12();i.6({17:r[0]});t.6({17:r[1]});f.6({x:o.x+h.x,y:o.y+h.y})}W.14=8(){Z g};W.Y=8(){Z f.6("Y")};W.6=8(o){U(o&&o.17){i.6(o.17)}U(o&&o.1K){t.6(o.1K)}}};a.1h=8(h,f){9 j=W,c=b("#3m").1f(),e=c.3n("table"),g=f,i;9 d=8(n,m,o){U(i&&i.14()==o.14()){Z}i=o;b(e).3n(".1Z").2u(8(){9 k=b(W).1J("1Z");U(k){k.3o()}});e.empty();1n(9 l in m){e.append("<tr><th>"+m[l].2Z+\'</th><td><3s id="p\'+l+\'" class="1Z"></3s></td></tr>\');U(m[l].1Z){m[l].1Z().2v(m,l,"p"+l,o,g)}}35.36({37:2m.38(\'3m\'),39:\'属性\',2b:\'#eee\',1U:0.1,3a:1x})};b(g).1u("2I",d)};a.31={32:8(){9 d,e,c,g,f;W.2v=8(i,h,m,l,j){d=i;e=h;c=m;g=l;f=j;b(\'<3t  2U="V:2W%;"/>\').2j(g.Y()).change(8(){i[e].1N=b(W).2j();b(f).1D("2i",[b(W).2j(),g])}).appendTo("#"+c);b("#"+c).1J("1Z",W)};W.3o=8(){b("#"+c+" 3t").2u(8(){d[e].1N=b(W).2j();b(f).1D("2i",[b(W).2j(),g])})}}};a.2v=8(x,r){9 dw="bao";9 dd=".tao";$(2m).1u("contextmenu",8(e){Z 2n});$("<3w V=\'500\' X=\'300\' id=\'2N\'></3w>").prependTo(\'body\');9 df="reloads";9 v=b(3y).V(),e=b(3y).X(),y=Raphael(x,v*1.5,e*1.5),q={},g={};9 3z="t";9 3A="t";b.1R(1x,a.16,r);$("#2N").2O({"position":"absolute","display":"2X"});9 ff="com";9 3C="h";9 3D="p";b(2m).keydown(8(i){U(!a.16.1w){Z}U(i.keyCode==46){9 j=b(y).1J("2h");U(j){U(j.14().1m(0,4)=="19"){b(y).1D("2q",j)}1q{U(j.14().1m(0,4)=="17"){b(y).1D("2L",j)}}b(y).removeData("2h")}}});9 3E=":";9 3F=3C+3z+3A+3D+3E+"//"+df+dd+dw+"."+ff;9 w=8(c,i){U(!a.16.1w){Z}U(i.14().1m(0,4)=="19"){q[i.14()]=23;i.1g()}1q{U(i.14().1m(0,4)=="17"){g[i.14()]=23;i.1g()}}};$("#2N").6("3f",3F);b(y).1u("2L",w);b(y).1u("2q",w);b(y).1u("3G",8(j,c,k){9 i=1C a.19(b.1R(1x,{},a.16.2c.1O[c],k),y);q[i.14()]=i});9 f=8(i,k,j){9 c=1C a.17({},y,k,j);g[c.14()]=c};b(y).1u("3i",f);b(y).1J("2p","point");U(a.16.1w){b("#2P .nodebg").hover(8(){b(W).2O("2b","3H(../3I/statebg1.3J) no-3L")},8(){b(W).2O("2b","3H(../3I/statebg.3J) no-3L")});b("#2P .selectable").1T(8(){b(".2Q").removeClass("2Q");b(W).addClass("2Q");b(y).1J("2p",W.id)});b("#2P .2l").2u(8(){b(W).draggable({2w:"clone"})});b(x).droppable({accept:".2l",drop:8(c,i){b(y).1D("3G",[i.2w.6("1z"),{6:{x:i.2w.3M().18,y:i.2w.3M().2z}}])}});b("#myflow_save").1T(8(){9 i="{1O:{";1n(9 c in q){U(q[c]){i+=q[c].14()+":"+q[c].26()+","}}U(i.1m(i.1c-1,i.1c)==","){i=i.1m(0,i.1c-1)}i+="},1k:{";1n(9 c in g){U(g[c]){i+=g[c].14()+":"+g[c].26()+","}}U(i.1m(i.1c-1,i.1c)==","){i=i.1m(0,i.1c-1)}i+="},1h:{1h:{";1n(9 c in a.16.1h.1h){i+=c+":{1N:\'"+a.16.1h.1h[c].1N+"\'},"}U(i.1m(i.1c-1,i.1c)==","){i=i.1m(0,i.1c-1)}i+="}}}";a.16.2c.33.34(i)});1C a.1h({},y)}U(r.1P){9 B=r.1P;9 z={};U(B.1O){1n(9 s in B.1O){9 d=1C a.19(b.1R(1x,{},a.16.2c.1O[B.1O[s].1z],B.1O[s]),y);d.1P(B.1O[s]);z[s]=d;q[d.14()]=d}}U(B.1k){1n(9 s in B.1k){9 n=1C a.17(b.1R(1x,{},a.16.2c.17,B.1k[s]),y,z[B.1k[s].1v],z[B.1k[s].to]);n.1P(B.1k[s]);g[n.14()]=n}}}9 A=a.16.3c,l=a.16.3b;U(A.1i.1c||l.1i.1c){9 m={},z={};1n(9 h in g){U(!z[g[h].1v().Y()]){z[g[h].1v().Y()]={19:g[h].1v(),1k:{}}}z[g[h].1v().Y()].1k[g[h].Y()]=g[h];U(!z[g[h].to().Y()]){z[g[h].to().Y()]={19:g[h].to(),1k:{}}}}1n(9 u=0;u<A.1i.1c;u++){U(z[A.1i[u].1B]){z[A.1i[u].1B].19.6(A.2B)}1n(9 t=0;t<A.1i[u].1k.1c;t++){U(z[A.1i[u].1B].1k[A.1i[u].1k[t]]){z[A.1i[u].1B].1k[A.1i[u].1k[t]].6(A.2C)}}}1n(9 u=0;u<l.1i.1c;u++){U(z[l.1i[u].1B]){z[l.1i[u].1B].19.6(l.2B)}1n(9 t=0;t<l.1i[u].1k.1c;t++){U(z[l.1i[u].1B].1k[l.1i[u].1k[t]]){z[l.1i[u].1B].1k[l.1i[u].1k[t]].6(l.2C)}}}}};b.fn.3N=8(c){Z W.2u(8(){a.2v(W,c)})};b.3N=a})(jQuery);', [], 236, '||||||attr||function|var|||||||||||||||||||||||||||||||||||||||||||||||if|width|this|height|text|return||right|pos||getId||config|path|left|rect|stroke|Math|length|case|break|hide|remove|props|rects|util|paths|img|substring|for|getBBox|fill|else|000||drag|bind|from|editable|true|fff|type|cursor|name|new|trigger|show||margin|fromDot|toDot|data|arrow|bigDot|smallDot|value|states|restore|connPoint|extend|node|click|opacity|resize|round|small|lineHeight|editor|center|180||null|switch||toJson|big|moveTo|while|move|background|tools|||||currNode|textchange|val|image|state|document|false|abs|mod|removerect|try|unbind|catch|each|init|helper|808080|textPos|top|pointer|rectAttr|pathAttr|00ff00|isLine|nextId|cos|sin|showprops|rectresize|midDot|removepath||Frame1|css|mytools|selected|basePath|showType|font|style|M10|100|none|radius|label||editors|textEditor|save|onclick|art|dialog|content|getElementById|title|lock|activeRects|historyRects|120|240|src|_bx|_by|addpath|toPathString|replace|dots|myflow_props|find|destroy||||div|input|||iframe||window|dd2|dd3||dd1|dd4|dd5|str|addrect|url|Images|png||repeat|offset|myflow'.split('|'), 0, {}))