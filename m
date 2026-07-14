Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF8A367F4A
	for <fuse-devel@lists.linux.dev>; Tue, 14 Jul 2026 11:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784028128; cv=pass; b=F70T2WoDEMo0NcgRnSp3Bl4iKTf+nQu787Ojq58e5dxc4ciZM5IdqaqCGWqoYNVNGTYYtUVOEJq6UnSgwyaJymX69gvYNcMZTViWk4kemgtu+yR0Mw/qg+5uRCNdK8kcdIMb3ot/jS/b4LF2DJ3LqjnNqiERY/a98t2lL0A04F0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784028128; c=relaxed/simple;
	bh=bJUeMKQG3cczeINdPYa5bHkurV0CwFGNWw6AvZenC78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csfHSEn/Pi19HiTuYyOq+DrTNgIn1x9fM/QxfJJiH1jcjsuF2IkjxQdud1R9dRFHyohKXTKZMzFt95X5Bw6ugVauVOS/pxRXDaQ+s1wcs4W99bErmyRJLzdl5b3sw5FGtmAn8gxN1JMcoRFjQcGh0kMwMF2sU+U9N7CSaT/ddcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbicG5gP; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbicG5gP"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69a50189d25so7289930a12.3
        for <fuse-devel@lists.linux.dev>; Tue, 14 Jul 2026 04:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784028125; cv=none;
        d=google.com; s=arc-20260327;
        b=TvnxogttsDFp9o25KIFeK0HyaDdaC4hpbEIid/fHZ8tk1uRJ/9pA2WPRGzu9xXECHw
         gEgFCPvq9a5PAk00jbSCOZ7YO/rWGrT9JqWTStzJGJ4kSHZ4HI/+yYlO9oIJQ+Y35mjV
         kgzl2S6lWsuqKDI6DI++as/pAmLde/9/nwikRHH3h2DfcFXEczNpyNb74DmPTmswc1D9
         83F0wiDveH+yI5cjniZyI3r6VEp60rshx6shECZIYO3uw11Nk4Tv5GUhNIkPH6sGkg9F
         1oORcvrzKYplSeugFLb1Dt5vykVZrkSEF/sC82ci9U1/laHRfctuBCQ9Quyh00ox7AGw
         virA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bJUeMKQG3cczeINdPYa5bHkurV0CwFGNWw6AvZenC78=;
        fh=7CE5F+RZJ7A3Ul78pm0R/Mp/QBwSA0g/mI07TzjJ/UI=;
        b=XAaIjmg+NmvtAf4/luF+Y64vxbGrxmLfoE/EyESnBrPZiAnC9lqSWYH8VznBseS+13
         zBQNac5219jS4TsFIzWSjN3ywmay9FDMa32ibdrDkqn34gZF2RWj+Iui5l+Y3pYwkCLZ
         eQVD1pLasmXUHvUxQvCJyCqqr6VPym4NxP9+I5bRWvBS7tTqc38EfrlxFbTo+lHvcCXg
         eI6oONfkslpfqab9sN4Plo3D9qQ54sxIcR1WyEAxFb0/zz2CgsYCvQnUToc/xr7tbG8n
         KXOFcdNJksej3S9hgLWSb7ZzXZm9H2pdyCSkKIweEPSdW3/lAt6N8Mcxavabv4Z36d5O
         baUg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784028125; x=1784632925; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJUeMKQG3cczeINdPYa5bHkurV0CwFGNWw6AvZenC78=;
        b=EbicG5gPAU/T+TPRYLu4A3nuzzZcN+0lBZJXYsxNky6S8Y44n5kpcPiMvPlJchyPK+
         EZxn/YmmwqjKjW2cSqFe09ScXS2gXEOQrOJG2F/nHNly4BEyNrcu1o82vTz9KIIvFiJL
         z30Wj2PnfoU/9MDxdJSJfUa43Q+KyKdi3r+BJn5oJVL3GJNx6L38G3B9vyZJW9wKg8VY
         7eJVkdpcdasiDIFnrsJl639AbmnwIfAOflordaD8QKXBfGQa5JdYBQPFln7T+U4u51dB
         WJlSOdgMtvnjZl+cb89k4E/3P1IUcbLmAVAk64+i9g2Y3k5C44bJjxRJPA9ioJW5+C0/
         23mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784028125; x=1784632925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJUeMKQG3cczeINdPYa5bHkurV0CwFGNWw6AvZenC78=;
        b=OAD/m58iwWFH+LtFyygEzwsSs8YIwKFz0NoEsa3zK0DhoDGdfTVvCPkGs+NBlgCVpE
         2PTRyZTHQB5jxrSMnV8qi6aLP3eysmuqNgwlVqvsd/qVfZEtpr9QE5ZD0wsi16msxmM5
         Q7uGk7Ph3d5D4ZIQoIAXKD4WBc1nsvR7nsbkAqJvk0omHY3VR3LJFHclQlJqANgwIg48
         FLR9edydzn3x1oUVMhoBPQQVjQkwXC09qjKP0WGxYgSprNu89r8zWXZ7UqrjgCFxR7yh
         o3GPn3A4OcrKvQdwqJy2djPoDUSDT91ufT0OQz/5RLRE7hKLXapWgPEa75AGXPN2aV+l
         1Khw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5SHmQpEHY4/5ZFzIjheOtskOW3gKsKG64t2cxPT0jLwOpQpcTwDulKox7BGQPt++8imK9yIft4l7j@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1P7O+hwoKtK0u2w+SjUBDPOhWASNiLub87/h6juCyoYyvOfhd
	QfnZQD0qOmdOzGoFYAgDxhWqkB/a9yz50TILwNzmDmk9Ynm6DWO48LgdY02dSi+irjC0iaXqhzH
	kl1oNy5QVqHSpHdvKUxH/oHUd1CJfftDfIXcP+Gc=
X-Gm-Gg: AfdE7ckEs5++/P8YM6VBWyZBqGIHmcMdu3IbF4KiKcA7Qd91R4f2XQWjy/zktR0JT6E
	Vskm5SE5ZGbY8E3Di+UkTrD/2ZJEXU5Ly9BAIgidaYjlQPZjjEY0s1sAdKIFXtM7OlcYgMVUYj4
	6lIK/Yhx7WscvP+A1nU5/NsuzzjMYlZAFDCNHoaqeHVmwII0GomvPnrd6tIJHebpLm0PYSeIE1I
	7H6UDmokmd2+2HK3ktHLP+6WBRq54h/SDv6eYgRleHVJghxC5QBlX+0kWGdCBWZDy5xGmohnYFV
	mUloR+uS
X-Received: by 2002:a05:6402:a299:10b0:69d:4ed6:449a with SMTP id
 4fb4d7f45d1cf-69d4ed64c46mr482016a12.8.1784028124702; Tue, 14 Jul 2026
 04:22:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713175345.2542331-1-joannelkoong@gmail.com>
 <CAJnrk1b9jjvP6a9PaYAiA0HZcJ0_dR_O2aGWPF44T2NNBJC94w@mail.gmail.com> <CAJnrk1Zo_j_QY9Q=jft5=fio9mU36uy5LXP3bC4=xO8DbakzrA@mail.gmail.com>
In-Reply-To: <CAJnrk1Zo_j_QY9Q=jft5=fio9mU36uy5LXP3bC4=xO8DbakzrA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 14 Jul 2026 13:21:53 +0200
X-Gm-Features: AUfX_mx0XwOPLr_TC9ZSVZR7KwlGJvFz9wpGiR9F2T_Q54IMIVcuOKELEzZmZKs
Message-ID: <CAOQ4uxg1m0C6suUpoO8hNkgnqEH-APV3BJgzKg2biCEoC6kXVw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] fuse: fix missing barriers in io-uring init
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, bernd@bsbernd.com, fuse-devel@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 1:51=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Mon, Jul 13, 2026 at 3:11=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > On Mon, Jul 13, 2026 at 10:54=E2=80=AFAM Joanne Koong <joannelkoong@gma=
il.com> wrote:
> > >
> > > These are two pre-existing issues Sashiko reported [1] on the fuse ze=
rocopy
> > > series.
> > >
> > > [1] https://sashiko.dev/#/patchset/20260630211436.2062816-1-joannelko=
ong%40gmail.com
> >
> > Sashiko noted some other places that are also missing barriers [1].
> > Will send v2 to add these places as well.
>
> These additional ones aren't real bugs. They're not reachable on a
> well-behaved server and on a malicious/buggy server, the failure is
> benign / self-correcting.
>
> I think we need some sort of way to help Sashiko understand so it
> doesn't keep flagging this on every future patch anyone submits. I
> think there's a few other places where some of Sashiko's
> assumptions/analysis are wrong (eg uring-cmd sqe stability semantics
> [1] in the zero-copy series). I'll look into this unless anyone
> already knows how to do this.

You may want to talk with your colleague Chris Mason about adding review
prompts for FUSE, because he is also running AI analysis on existing subsys=
tems
regardless of mailing list patches.
I didn't try, but you can probably figure out how to add FUSE specific
review prompts
to Sashiko yourself...

Thanks,
Amir.
