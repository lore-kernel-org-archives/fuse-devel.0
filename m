Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F552F39CE
	for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 02:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781144055; cv=pass; b=Tmo5rkbwjizgcKC+jE1XeaoFksyJAJRk9/Z3Kjq9gdhyoqPeKNG29U/WbzWPOO63z6+oZ/mf5W9oEu1sjR7yB9ovrzjz0fKsNUyZOtzRK15Tlk/ptDNL2co5MaE5raxeK09OjSCrzPAWAOcrpm3dCqj9DXb4JU+nSGInCMzECxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781144055; c=relaxed/simple;
	bh=yTeW32ZjojfFkvzHApa51TykA5nmfoS9M473ZyBJFwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hH5mzD4NVvsV64YM5rp8wxLUW+R+4lW10ZTkAQppdeuMwCdFTEMkRKFz8WCseLuS9jyPg7hBt8szQbjQHxYEORDLc1ARmkYkBT7n3wGcXDaQGcJFFpBHU4jjnDNZ5tv7CWDkYGyNVsV7x150Ll8zsSTtMf++sIXFD0+2Icjkng4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVYS4iES; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVYS4iES"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so94334405e9.2
        for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 19:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781144049; cv=none;
        d=google.com; s=arc-20240605;
        b=Q7Y47dqfZo3RiH5di/m8s6Ps1KGMlL9iJFy2lCqW/DYn8jvPery4t1rS1YgL6aPGwe
         iv2kwUJOMiedYTHwJZjyruTZf0DspW2zGSOvmT9LK+i0u1toZcVod8OD2TSG6JYdZ2VG
         HHi3RbVYf2yfu0jHMoL4LUv3cN7faypN4AxIHV3Fax/5gfyXKxH2TDecNNpUy277A34/
         ZllRw8rwaQDBTvof4fk4QY1t42dbbDTev5FYZC0POXiZBJgl1xKafGSFKGuve/lCn9qF
         F89/5M7c4ZOV575Jyl2H2B8ahY6SDIqgcqXLa9MMX69t1sp/tedp0MlEYZZb1FjEPEuK
         0X0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bNqL6h7b1UInsa9F8t7zHBRHw828NI7jfKF/lno0rzc=;
        fh=btqwUEDg2a4I7lzI9cxKmwmpwnk7FwTwX0+8ySBj31M=;
        b=I1L1vYin3QPKDfWneut4BmkHv0Xokyck2LJIdjfb85GUE/4fKrsdBvAF18XJRI3JW/
         SRkOdDETj5a2SL7o8h+SAAKTD1L1mdXFHLb1bqz66AjBt9xDD81o4DTgpWKDEY/hhZgg
         i5psJk1hFWYLQ1xZypRQ2Ofc98jdALK3hhkNHuBwpcUv56P0WaqjY/jrl3Cv20u/CX5u
         n2kIykAyxini9pHieDLBvWFyQmhbpW6bGqIKx9TfzLL81vy0pZ4DTeM1rHf4IA2XDcpZ
         H1ekBMjiOYo3JyHXkmpri5KCD0LA6ygIoxacedvW+pWtftfPiVFnm195mZNk+ToupbKy
         QSgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781144049; x=1781748849; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNqL6h7b1UInsa9F8t7zHBRHw828NI7jfKF/lno0rzc=;
        b=SVYS4iESvCFcxLppXiMuOVxSUc88memflz+QQyXKtJRid9VI7IfzzySa2fqFneajL0
         DMTFOUOmdsydZY3X1BwNbEfG0Gt2YmWjUSIjbL68ivBlka2OGuJZUazz/Cxvhkc8C2Df
         HfZxInC3SNOqgKQR7r0uG6JKK02cseGsqcsTEn/Ctgg3v0eQ48Bc0CjF2CpiJABj1KuZ
         zxaxIWsENlJhBiZ/ZFwtthr+sXw/GIsvb9jWy17CIS2bOBszroZRgpatCPWqsFn22QcH
         uqZjw+Rsadc1+ixuDx61SryPEsWydKRtFP4qs+kSLnRt1sspBg17cOUnivtERVuP5PWS
         bJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781144049; x=1781748849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bNqL6h7b1UInsa9F8t7zHBRHw828NI7jfKF/lno0rzc=;
        b=N8rUo8wyiA3pkPc+YMqAwX4YceETZjXpytvkymk7oGWTjq5aLKv+b4l78tHdDILRQB
         NR1VAs0uVVOsZZiEB9yxKQGERIKjscoIqAj5v/NRgYVgzy9Hx7NVSjZLBNoBUxRyrCCE
         MVtXww+DAFRYKVyIONWAO04dT99bCxnXhVnDLnkDq5YGhIwZ01OU/PJOrBP/RU4N4sva
         lmxmUdW/bmdV99Gnoy+i8FhPQdcUGJXDIPnhwdAu7SQ++UGPEhQHMB+FFNkUaLP2M8j6
         /ur/GO2GFDtDkwAYckk6Ea/VwWk8/cxUxD1iT6TZTb537uhBtLomMmkN7Dmoqpc/Rhi4
         xuYg==
X-Forwarded-Encrypted: i=1; AFNElJ/EiMVIyf6DTz8JXhRiu93Tt3O6qoznMmdHVh2BADXBbv3D7ErLd2i7/bxRKQSPC2mD0QusAt3jcVmj@lists.linux.dev
X-Gm-Message-State: AOJu0YzRpkTAvN3XXVJXm60THV6jQpYpv/bGyUQfAQ5JrdqC+AuGCJFA
	JLHjnUTDyim/8Ef539ZFnDOMaIU8WLFZrxwg5/yTqtISG0klityWKbM9+7fNo+Y7iaA1kSwusI8
	AKGnCbvIsCFgAY6OE8+St99xB4QLxpho=
X-Gm-Gg: Acq92OFFZZ+W3+sY0mvwi1XzN9z3wtor1pkcZQV6V/YrOlzgLXX3E1G3mXfL3qWq9s0
	BivoNxf9ERgHw33EH46oVRZORRR5MwoKPPEZux9Vk9guJVGe1tWhzvPqSwvdBDXtrhA9R/EUJG9
	joqEGAHP7tD/fjYjmOJZq4QQBAqOughDyLXwtUHEzt120QeJNdIl9GUjfzeDzjDVBBBPszSgyhw
	hGI18ei1O/ufdVOfkaY6DzRp6z2XPfDtG3lsJTiqPxHCbzhjVe2aaO5Tza7kA88r2HRVV/tDW3G
	7sVCso/OfF32A1W2r3AlUFbztKZo4lJcKBkEjC9tvNn2nNilTX/8hWakOEzjH5FyMzkPSpUQjw=
	=
X-Received: by 2002:a5d:5269:0:b0:45e:fa17:a1d5 with SMTP id
 ffacd0b85a97d-460677b5c29mr689175f8f.33.1781144049371; Wed, 10 Jun 2026
 19:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com> <CAJfpegty63HGGNR7Vm0mpfs+PW0-r-hJDSASsRMk3JwsHTyrvw@mail.gmail.com>
In-Reply-To: <CAJfpegty63HGGNR7Vm0mpfs+PW0-r-hJDSASsRMk3JwsHTyrvw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 10 Jun 2026 19:13:56 -0700
X-Gm-Features: AVVi8Cf-1F0NUitYxQlWw8Fh7GCCEIk62mi5unVyBfygti873c0QRCPwjFX_Lk0
Message-ID: <CAJnrk1aZvGbL276PfqVtroJuQMgwMOzCxiipMD6wH09DMVUCyw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] fuse: {io-uring} Allow to reduce the number of
 queues and request distribution
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: bernd@bsbernd.com, Luis Henriques <luis@igalia.com>, Gang He <dchg2000@gmail.com>, 
	fuse-devel@lists.linux.dev, Bernd Schubert <bschubert@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 3:51=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Fri, 29 May 2026 at 00:55, Bernd Schubert via B4 Relay
> <devnull+bernd.bsbernd.com@kernel.org> wrote:
> >
> > This adds bitmaps that track which queues are registered and which queu=
es
> > do not have queued requests.
> > These bitmaps are then used to map from request core to queue
> > and also allow load distribution. NUMA affinity is handled and
> > fuse client/server protocol does not need changes, all is handled
> > in fuse client internally.
> >
> > Signed-off-by: Bernd Schubert <bschubert@ddn.com>
>
> Joanne, your RvB is on the first few patches but not the rest.
>
> I'd be more happy with a fully reviewed patchset, since this falls
> outside my current expertise.

I'll prioritize this.

>
> Related question: do we want to request automatic reviews by sashiko
> on fuse-devel?  I do see dangers in relying too much on AI reviews
> since it makes us lazy and complacent, otoh sashiko does seem to
> provide useful feedback.
>
> What do you all think?

I think this is a great idea.

Thanks,
Joanne
