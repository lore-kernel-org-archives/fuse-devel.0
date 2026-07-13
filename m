Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B4237A839
	for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 23:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783986695; cv=pass; b=F5Nqxh0D9arR6N9UY+nUd1YqiQtQEx3IJcra4jRcuRAEQtnUBYsMfPq7bwQs/hPpXmGRWAt+A/KVxHhket6v3KdaVoD+O0aj1SDWsmwyhQw3xA+r8J5HZFoW/6oCSSKe2QaNGXgkDI8vEJcUJuTiHQnUqP9azY28/zzGlkdXCtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783986695; c=relaxed/simple;
	bh=QIDOrEJ4WepeZV45FGMnOxOTF8vP+LfpfgppYUTtmao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qttzvaldVgiqZZIOJml9Sulm+y8u2HJeKNhsED8tjlpJ0NgRsnBTpk9vxwca0Gqw285P9vSkTs5c0UeIYfoMYfdTt5ynaP6h5tJVegHznw5A6ni6VBCgFC7M6qZzVkbmjLvX9JD53RnRNBNxdA+9l1e7PwL1HhDrWLFv6LhT7/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khm/+u9z; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khm/+u9z"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de0093c42so287720f8f.3
        for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 16:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783986692; cv=none;
        d=google.com; s=arc-20260327;
        b=fhBOVy6pyYLRb9yVuqi2ek0C4PjV/T0Qo75aEJnLsOo2ouJs1fv9dsiDd+1f7ZI0Rz
         u+rTw0EJ5etuVkj5IBGdmhx12l0c+XkHohj6sI+3O+IsAZCInknVJlDtW6ADdPxXOeOS
         5dJM60rmWy/dOyUnvLRuiETitU3gVB6AmoprprRAiwlSgrDxagLh2L8eqbvfqZerwqIZ
         1YHQMeNU1cSTDXnJf+IFrEom4uG+vEBuAnju3zLCu9MZ4IXJfKbC1ZpxG2e71gTQh7c4
         0h5tRyr7PFihWvNGSqOeu1rWo4WU0cAixXAzJbwLOCzzmLY0Jmzdwu53/SEscbjV/i6N
         YlPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QIDOrEJ4WepeZV45FGMnOxOTF8vP+LfpfgppYUTtmao=;
        fh=QinOkR/v+QSoOPiaAYElXOdlTqDkCgDAFawHHu9orEY=;
        b=iunXKKIUjBGiKqNDtt4bL4Oc5eQ24RzWUl5aN1eSRfsDOowHPFmJKjOk91CgezF4ON
         iLwFaMO/TuKxiNKKVkoIgW+kuPbQuPEJCjQUTeCHHPmMeh+3Pg6uVmSVyrzBfzqtd7oh
         T9fwjbl0WL5MiFm0Ba70nEHA5ytlDKkFHyv6pmaFn5nijMtbYRyvRypn1YjTARyqRiQr
         gDBLrnD0UBm5pD10Qt43orya/lA6ODAExHgxdqc+7S8gHPlu5EuHt25KlniN+NbS1Uwn
         lSB+8/g7jLYeG4mK3tX5ysfzLUd1VzCQUD4dHMA3J0l1bUSCR6mo/WFi6AIJBwln69dv
         1WYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783986692; x=1784591492; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QIDOrEJ4WepeZV45FGMnOxOTF8vP+LfpfgppYUTtmao=;
        b=khm/+u9zHd3ilPEVZQPWQMcRwYjOUHn3hK231SsylWJhS3dZmrZn5aETN4eReZH+3Q
         A7hsc2+N/xSAf5MBQZp/CvCxx82W49O3gw8G1PAH6l9/OTtOOQ+mN98J6Pvhz/Gtbfmh
         RZpp9TeB9b9NM87rWarHg6XxOovj1XUUhhnRsFxdBkLN1bQcBSgYVnMNRkhTQI3e753j
         YEU9WspuwQX5Mc5iSKgiqPE8EN/eB5/ZthB7w4cMu+dywD3r5pO9wUUtAUAbFArDZlSn
         CeKLSaxf58pIMH3h6gH1ti+FXay672R6OujKufS8zcutive45J3GRso2PFVAsNCf4G9q
         EMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783986692; x=1784591492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIDOrEJ4WepeZV45FGMnOxOTF8vP+LfpfgppYUTtmao=;
        b=mT7tGxqkkoqJF+tXqbrwHuy8SQvrWyu0lUq7B6H+TzSLR/AwkrL73mmLgxQp//2edS
         Two2XE18c0q2rNCIydtFKTsOCId8fi/F1fzjA3WnTqUJif6JTkCk2V+yJ7iNcCQO5d4a
         zVe1ONz/X++JlQBOe2gkFTHEYkOZ8e6kAp3FzJKaql5rkppAESWV6Y4j0kJFfM0W/ImR
         SMWl9LI0UoY0u8NSwgyFOtmMtXEdnizVMQtS/nZ3iJSLQEStmJ9vcFktziXaZTMWQ/kG
         kx7VHQNL6xCRKFPh/BuEGr1rSd0Q+U4Xqhn6MiS6+rBjFOloU1x2V+okFUgfsksoc5/4
         1S9w==
X-Gm-Message-State: AOJu0YzJYdpNbZZMmd4w6Kl9h7LXQadCsuEQi8Q2yDzWF76s6sI0uWdB
	+bTBZEsG7dMd8y+GEFpJYET952DCgKQ/qcOhjh+ynvhQHDquUijZ2h52xPwyq7iEW6jN7ktcHle
	e/LzQfXQOKdDK1MOEsm1iENE+iakRFyVV4rfYmCE=
X-Gm-Gg: AfdE7clyQj/qCVpaxSIL+EQNylckfcbkDf3g5/yhN7gCJlt2V/dQVebiusx8L/7Awlh
	Y5kQAIjf84fu0XLgXAM6eGzew3DMKbYNvv15fJYIF3oG03amj056Y4w4v55jkqy2ClD18/9j6vv
	6vjfmkzad322Tf0LPJeDnoX0yaNWC5f/ImP892aBSbpDbuTf/e02Bxqxt0tKaAL7tiFQg1BEi17
	Bdnw1B+FrU7TyzfzJIKNYTX5ORqdQWm+EhBzg+67tIMth/f2wX8f/ETo8LBwaP34Cr+LSU1bXNw
	u9tPXVEIBCFeoKDPKzd2/gv3DfklZwHOFbujsnMkKJyiH0xY+oXZSPmWmJE6lsr93nb9SQ==
X-Received: by 2002:a5d:5c89:0:b0:476:cfa0:a976 with SMTP id
 ffacd0b85a97d-47f2dcb60fcmr13603037f8f.5.1783986692301; Mon, 13 Jul 2026
 16:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713175345.2542331-1-joannelkoong@gmail.com> <CAJnrk1b9jjvP6a9PaYAiA0HZcJ0_dR_O2aGWPF44T2NNBJC94w@mail.gmail.com>
In-Reply-To: <CAJnrk1b9jjvP6a9PaYAiA0HZcJ0_dR_O2aGWPF44T2NNBJC94w@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 13 Jul 2026 16:51:20 -0700
X-Gm-Features: AUfX_my6FijZPNDEgqBOq4yrwgYzrjba6PmZziF1Sz1HBvGPPiRPm2XXMZ3jWL8
Message-ID: <CAJnrk1Zo_j_QY9Q=jft5=fio9mU36uy5LXP3bC4=xO8DbakzrA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] fuse: fix missing barriers in io-uring init
To: miklos@szeredi.hu, bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 3:11=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Mon, Jul 13, 2026 at 10:54=E2=80=AFAM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > These are two pre-existing issues Sashiko reported [1] on the fuse zero=
copy
> > series.
> >
> > [1] https://sashiko.dev/#/patchset/20260630211436.2062816-1-joannelkoon=
g%40gmail.com
>
> Sashiko noted some other places that are also missing barriers [1].
> Will send v2 to add these places as well.

These additional ones aren't real bugs. They're not reachable on a
well-behaved server and on a malicious/buggy server, the failure is
benign / self-correcting.

I think we need some sort of way to help Sashiko understand so it
doesn't keep flagging this on every future patch anyone submits. I
think there's a few other places where some of Sashiko's
assumptions/analysis are wrong (eg uring-cmd sqe stability semantics
[1] in the zero-copy series). I'll look into this unless anyone
already knows how to do this.

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/CAJnrk1Y2tiwCecH-HVyaP79kcmBoEYu--mm=
wRKzp=3D9uZNaiSUA@mail.gmail.com/

>
> [1] https://sashiko.dev/#/patchset/20260713175345.2542331-1-joannelkoong%=
40gmail.com
