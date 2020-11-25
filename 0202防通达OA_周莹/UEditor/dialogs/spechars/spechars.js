/**
 * Created with JetBrains PhpStorm.
 * User: xuheng
 * Date: 12-9-26
 * Time: ╧┬╬ч1:09
 * To change this template use File | Settings | File Templates.
 */
var charsContent = [
    { name:"tsfh", title:lang.tsfh, content:toArray("бв,бг,бд,бе,бж,бз,би,бй,бк,бл,бм,бн,бо,бп,б░,б▒,б▓,б│,б┤,б╡,б╢,б╖,б╕,б╣,б║,б╗,б╝,б╜,б╛,б┐,б└,б┴,б┬,б├,б─,б┼,б╞,б╟,б╚,б╔,б╩,б╦,б╠,б═,б╬,б╧,б╨,б╤,б╥,б╙,б╘,б╒,б╓,б╫,б╪,б┘,б┌,б█,б▄,б▌,б▐,б▀,бр,бс,бт,бу,бф,бх,бц,бч,бш,бщ,бъ,бы,бь,бэ,бю,бя,бЁ,бё,бЄ,бє,бЇ,бї,бЎ,бў,б°,б∙,б·,б√,б№,б¤,б■,й@,йA,йB,йC,йD,йE,йF,йG,йH,йI,йJ,йK,йL,йM,йN,йO,йP,йQ,йR,йS,йT,йU,йV,йW,йY,и@,иA,иB,иC,иD,иE,иF,иG,иH,иI,иJ,иK,иL,иM,иN,иO,иP,иQ,иR,иS,иT,иU,иV,иW,иX,иY,иZ,и[,и\,и],и^,и_,и`,иa,иb,иc,иd,иe,иf,иg,иh,иi,иj,иk,иl,иm,иn,иo,иp,иq,иr,иs,иt,иu,иv,иw,иx,иy,иz,и{,и|,и},и~,,иА,иБ,иВ,иГ,иД,иЕ,иЖ,иЗ,иИ,иЙ,иК,иЛ,иМ,иН,иО,иП,иР,иС,иТ,иУ,иФ,иХ")},
    { name:"lmsz", title:lang.lmsz, content:toArray("вб,вв,вг,вд,ве,вж,вз,ви,вй,вк,вё,вЄ,вє,вЇ,вї,вЎ,вў,в°,в∙,в·,в√,в№")},
    { name:"szfh", title:lang.szfh, content:toArray("в▒,в▓,в│,в┤,в╡,в╢,в╖,в╕,в╣,в║,в╗,в╝,в╜,в╛,в┐,в└,в┴,в┬,в├,в─,в┼,в╞,в╟,в╚,в╔,в╩,в╦,в╠,в═,в╬,в╧,в╨,в╤,в╥,в╙,в╘,в╒,в╓,в╫,в╪,в┘,в┌,в█,в▄,в▌,в▐,в▀,вр,вс,вт,вх,вц,вч,вш,вщ,въ,вы,вь,вэ,вю")},
    { name:"rwfh", title:lang.rwfh, content:toArray("дб,дв,дг,дд,де,дж,дз,ди,дй,дк,дл,дм,дн,до,дп,д░,д▒,д▓,д│,д┤,д╡,д╢,д╖,д╕,д╣,д║,д╗,д╝,д╜,д╛,д┐,д└,д┴,д┬,д├,д─,д┼,д╞,д╟,д╚,д╔,д╩,д╦,д╠,д═,д╬,д╧,д╨,д╤,д╥,д╙,д╘,д╒,д╓,д╫,д╪,д┘,д┌,д█,д▄,д▌,д▐,д▀,др,дс,дт,ду,дф,дх,дц,дч,дш,дщ,дъ,ды,дь,дэ,дю,дя,дЁ,дё,дЄ,дє,еб,ев,ег,ед,ее,еж,ез,еи,ей,ек,ел,ем,ен,ео,еп,е░,е▒,е▓,е│,е┤,е╡,е╢,е╖,е╕,е╣,е║,е╗,е╝,е╜,е╛,е┐,е└,е┴,е┬,е├,е─,е┼,е╞,е╟,е╚,е╔,е╩,е╦,е╠,е═,е╬,е╧,е╨,е╤,е╥,е╙,е╘,е╒,е╓,е╫,е╪,е┘,е┌,е█,е▄,е▌,е▐,е▀,ер,ес,ет,еу,еф,ех,ец,еч,еш,ещ,еъ,еы,еь,еэ,ею,ея,еЁ,её,еЄ,еє,еЇ,еї,еЎ")},
    { name:"xlzm", title:lang.xlzm, content:toArray("жб,жв,жг,жд,же,жж,жз,жи,жй,жк,жл,жм,жн,жо,жп,ж░,ж▒,ж▓,ж│,ж┤,ж╡,ж╢,ж╖,ж╕,ж┴,ж┬,ж├,ж─,ж┼,ж╞,ж╟,ж╚,ж╔,ж╩,ж╦,ж╠,ж═,ж╬,ж╧,ж╨,ж╤,ж╥,ж╙,ж╘,ж╒,ж╓,ж╫,ж╪")},
    { name:"ewzm", title:lang.ewzm, content:toArray("зб,зв,зг,зд,зе,зж,зз,зи,зй,зк,зл,зм,зн,зо,зп,з░,з▒,з▓,з│,з┤,з╡,з╢,з╖,з╕,з╣,з║,з╗,з╝,з╜,з╛,з┐,з└,з┴,з╤,з╥,з╙,з╘,з╒,з╓,з╫,з╪,з┘,з┌,з█,з▄,з▌,з▐,з▀,зр,зс,зт,зу,зф,зх,зц,зч,зш,зщ,зъ,зы,зь,зэ,зю,зя,зЁ,зё")},
    { name:"pyzm", title:lang.pyzm, content:toArray("иб,ив,иг,ид,ие,иж,из,ии,ий,ик,ил,им,ин,ио,ип,и░,и▒,и▓,и│,и┤,и╡,и╢,и╖,и╕,и╣")},
    { name:"zyzf", title:lang.zyzf, content:toArray("и┼,и╞,и╟,и╚,и╔,и╩,и╦,и╠,и═,и╬,и╧,и╨,и╤,и╥,и╙,и╘,и╒,и╓,и╫,и╪,и┘,и┌,и█,и▄,и▌,и▐,и▀,ир,ис,ит,иу,иф,их,иц,ич,иш")}
];
(function createTab(content) {
    for (var i = 0, ci; ci = content[i++];) {
        var span = document.createElement("span");
        span.setAttribute("tabSrc", ci.name);
        span.innerHTML = ci.title;
        if (i == 1)span.className = "focus";
        domUtils.on(span, "click", function () {
            var tmps = $G("tabHeads").children;
            for (var k = 0, sk; sk = tmps[k++];) {
                sk.className = "";
            }
            tmps = $G("tabBodys").children;
            for (var k = 0, sk; sk = tmps[k++];) {
                sk.style.display = "none";
            }
            this.className = "focus";
            $G(this.getAttribute("tabSrc")).style.display = "";
        });
        $G("tabHeads").appendChild(span);
        domUtils.insertAfter(span, document.createTextNode("\n"));
        var div = document.createElement("div");
        div.id = ci.name;
        div.style.display = (i == 1) ? "" : "none";
        var cons = ci.content;
        for (var j = 0, con; con = cons[j++];) {
            var charSpan = document.createElement("span");
            charSpan.innerHTML = con;
            domUtils.on(charSpan, "click", function () {
                editor.execCommand("insertHTML", this.innerHTML);
                dialog.close();
            });
            div.appendChild(charSpan);
        }
        $G("tabBodys").appendChild(div);
    }
})(charsContent);
function toArray(str) {
    return str.split(",");
}
