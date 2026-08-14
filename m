Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D740948C3E3
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 17:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786730171; cv=pass; b=XcUnhZUYjIPvwLf+IOeyfrmFrX1kynCUss0MdYnNyIeOC9CHZ9gQ7zoI6ncCHPBYtZ+4EDGbAHAmp+UIWbT1SxQkakDVfhFYMR4ohEtl9NUTVAjEFtynijmIQf2PZkouEcKRDf4JJDLJPZT2U7LEFre+bfkpfzgphZcZ7DqJfbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786730171; c=relaxed/simple;
	bh=/tcVT1kP7qn4PUXJ2CmSXJYRc+a7Gm4H0BFC3pJEBMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhdXnbVaEhJwBc+fhEmKZQBA/WkNBk3Yfv0QxUlWmihHT8JySyzeBfG6F54Cr2Z9ondqMZmr7bIwSF9hCC7RIgBcy1VYgMNxOw4m8IuQ9705sbP6gCHEgewa+bHcFnkVsu5r0y2m8NIT75NCs0XGySQ3OWIdn94G9XzxozMqN98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYd8Y/G8; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYd8Y/G8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47db714766aso1454337f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 10:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786730168; cv=none;
        d=google.com; s=arc-20260327;
        b=GzpUlof2OXJ/tLH8dw14/UqYD6gc94VoCNQOGtd5jqkrvBoUf5zcswD9T2pl8l9QHS
         0mN2bqZQ9LfGd3D7hzM1n5dI2d/tUpnhJ4taBU10Ef7cKfZvy6+zmybEyOB39aRXFRRm
         9dKX/c6DSW6WWNN/DPr7KioBHCVD5v51mgfELaypKCyc2xqBXtry3eFVb/2UZS/mknHp
         ZUmCwaopEOwnOvpmet+P/J8A9ugN+AD1QodZGF/iLa9X8PkIk0g4ckhx6ri0Q/ay2zjX
         /0Fb2CkHrRFG1ueDbTCwhBOGoyJ8gTuRc/YCIWXzAT+VWMvbmi59plmdZsErc06i1H1t
         RGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/tcVT1kP7qn4PUXJ2CmSXJYRc+a7Gm4H0BFC3pJEBMk=;
        fh=9xbdbBgeoqUu9E4wjJOv7o1DcnDwSCqKnVBZ+0SvbOw=;
        b=bfzf0aGd5vbKRw/Mt8hXIjwjDjgDxfDB17CEXJOggx/aWuvzsBvRGLegvRCUJob5U8
         35a005Q71j5C3CAL7Q+JGHzLMEaWspEtBeGqTcX572k4GX3CdnoTQrpainHL9wfw/0U2
         JR0sRnytp8VDGnioKIGeyGwkk1ZW+V1SPZFLy9jo5lK7B0vSUPRZE2FXAIp7xaAbWqpo
         VIxg5AYtMIXdaTf0nFag9pkvDEtp26TtB/M8Bq8wlkcMqFUwbvWc3rdKFZUktNo/f6RG
         NTsgTA9JQ8LUqsP7gZ1pv/8j8AuKUgtqDxm7kMIPNFssYU0Q7bXPzaJ/2buZgcpcIAKj
         eTgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786730168; x=1787334968; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tcVT1kP7qn4PUXJ2CmSXJYRc+a7Gm4H0BFC3pJEBMk=;
        b=kYd8Y/G8LJ0zIZ/umB0BkIXyS9HgfztJpHG1PIwWHbV+FnInNvfUM5RKo7OvstRsEf
         6P7tpphD/5XUzj0bSGyzyIzBohNYOqtYfE+fPK6mGGiu6/3wWxwJZubx0fX4g2DtXyfK
         T0C0x7QQzM2U22Y3iBFEM7zL1KB0J3259Xh4UHMmr99g9teDVvFrdLs7PyZKzevDPlLh
         XnRiijm+L8qojnFrX/yOmGlG+zAfTj5raRLtNnY13JW2KSoxOCBZUE45TStv9A6nqWWm
         87enCR0NfQ7WGtkQ2I7W9Ibxjx6IDdrKJHg2/A4g0Z31VsUvu8squpr8ehp00/DPBs/2
         5hpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786730168; x=1787334968;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tcVT1kP7qn4PUXJ2CmSXJYRc+a7Gm4H0BFC3pJEBMk=;
        b=KQcId4m6vquqBn9NkGD0IeuokYnyGEc4IFdXdUPJoyObbwL4WgkUlCXdYroD1W8HZc
         74Yx/uVh6X68HNOFDqreXevJS44HAJNF/Xky7iITMgVi2sfA2V9B9Lvof9LqXF4Ih4of
         wFqgl+gwDMkgFzxWeBxv8WfViZtiiCgcIzoz1GCrogygW3+GoIn2RklTzzxcjUhRDt5G
         fsjucmbWPlkVywytXkm8kOoE9gtMol3dXNIrRRuNYvx0opVCmRLQu69bsEATyWqBPKoJ
         8ZAX2S7btdVCDIE7mWalczNWux2IKG67qgtLrN/sb/ks9E0DxBHPskOuZCeeZLDlqRUE
         PzyA==
X-Forwarded-Encrypted: i=1; AHgh+RrkDmQ0Qe+uRrMoFuqpiOOUKJ31Q9bmIA/W+66Cc9r+z1HHvAImeIeZP/NQUc8jhVWnlBNh1b/kehxb@lists.linux.dev
X-Gm-Message-State: AOJu0YzAxJwXzB1yzCQbrEqt/EH5DUW6as6R1gtctwT7LfrqiE7vXqOt
	kIkP59AnmIK8Lq4BsbySpne1qM4Q+CmqUTd0LI2J7NAhL3vThHQA2UI8Nww6RvFWNNtJEYdyVwI
	MPYLCB8/tk+nu0z8HQ9ufyMoueV8saiE=
X-Gm-Gg: AR+sD10HnTnhO0KyJWsjm6UjL8QUChPnoEU9JBuHzdhw5hpJ0x2JndFXZt4u1R3hz00
	6MuhZwaGEwqN9/J6UYo9fL0XLXKRW3Ix9lGFXDeCFs55Pomp5AW2NApLPSDmG5ntUxvkV6vVApM
	1VCFQe5SBk/EcgYDmisZ9as+mC4jKZiLeSnmVPZEbiuEPrua01N0wK8/52OAkH/VGP1Xl9bnMqP
	OtZk5BR+Irz4AZdGmdDmNLksWB5OBKm5v9PS1U+zpN9cytxM/EfyxiGdpsxBY1DKw0DvDCQoqN3
	Y2SwvExgI1DIJNyuP1VLr8UhjEVhdtB8TYZLPTbPnw5WfcviGuJ6VO8hRy3rySDtkzFrnNF94Sw
	PMr3njasBZDdrd7zLcBOSDkPT
X-Received: by 2002:a05:600c:8119:b0:499:596b:2e91 with SMTP id
 5b1f17b1804b1-49987a58078mr104107235e9.3.1786730167828; Fri, 14 Aug 2026
 10:56:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-6-joannelkoong@gmail.com> <777e9671-aff7-41e7-911c-dc3aacc877f3@bsbernd.com>
 <CAJnrk1bmxOXn=4W8fgn1ckGsoJasQ0AzuZpBP46uA3bhQvyjLA@mail.gmail.com>
 <d8ead20f-91b6-49d6-95f5-f54dd76a411d@bsbernd.com> <CAJnrk1Yw7Pf96GQpguY3HjzfTn47r+O8KGWQZJmuikC5aAGP7Q@mail.gmail.com>
 <4484d6f7-652b-4c7e-af49-6972753d133e@bsbernd.com>
In-Reply-To: <4484d6f7-652b-4c7e-af49-6972753d133e@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 14 Aug 2026 10:55:55 -0700
X-Gm-Features: AcwNN1WQixcfSv5RA7x_1CAeGq5JW93AcjkfEGZVHJlHb22NJwCqXY022kQebaI
Message-ID: <CAJnrk1bnohB5QPib4tKK1mYCyD_EeH2oMW+Qgo64k6HzmmK-Fw@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] fuse: add zero-copy over io-uring
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com, 
	axboe@kernel.dk, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 1:42=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
> >> As far as I know kmalloc will allocate continuos pages and might fail
> >> under fragmentation if more than a page is needed. I'm not entirely su=
re
> >> if kvmalloc for such a small allocation will actually do the job.
> >> How about the attached patch? And with that maybe we should limit
> >> max_nr_pages to 256 for ZC?
> >
> > I think kvmalloc should be fine. For size > PAGE_SIZE it tries kmalloc
> > first and has a fallback to vmalloc. For small allocations, kvmalloc
> > is just plain kmalloc.
>
> I think the patch I had attached is more elegant, but we can do that any
> time later. I just found kvmalloc_flex, I guess that would be most suitab=
le.
>

I'll change this to use kvmalloc_flex.

Thanks,
Joanne
