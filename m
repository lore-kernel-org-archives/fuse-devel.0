Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E87145349C
	for <fuse-devel@lists.linux.dev>; Tue, 19 May 2026 14:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200286; cv=pass; b=E4eH7khvPzXJhDYNjmMhZEx0pRsBx+O1s6H9uX4k46ip8YsMuX5qyLEoPh28ifInUkEBRaRjuaFfQ7kjdhcVeP5Lhl4zbhmcbAFDWm/74isQuDaAjGYJ/tF+Zkb+fNWA9J74ypLR814j8+4fZ/l2eMNmx5PioVXi+X23HfrMPig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200286; c=relaxed/simple;
	bh=KcpyWR9ztcaYoVXnyA8OVvjUi1zJWAvkQ8opvq0mx7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNiEdye9lyQHI+orBcl1Z6Gs9CZ3ddGlZ+9meSPmpqs4H4fbMYdZzHwV+TabB/Cm/cRLeqBpswFNCMDvHY+HORHfFFY3YmIzKXkqurAbelVksDHOO1cgvmJkWOUv5b7P2CNAJCTEgTLcMsGXnnHYtaepkR7A+13JxWAUhwLkgEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFwMw/Q9; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFwMw/Q9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-67929ff6dbfso6106983a12.2
        for <fuse-devel@lists.linux.dev>; Tue, 19 May 2026 07:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779200283; cv=none;
        d=google.com; s=arc-20240605;
        b=SWMNkZTNfYqN3rcYEa7Q6k4GrmEqhIjBAsGllXQe3wcLqKSyCbsRwPHw81SsTJR4Bw
         v3y4gM4O/x1kNdJvGdzSYIYBGGeXfyVg8sswMyicRkqqthc70/cMiY7yRy1w46es0iK7
         fFq+MqdoGxDxfmqG/9eUHQPimolTQ7fYlkGxRUSlqv3h+vLPflL4k0J9LjljitGYBeII
         CI45bTMUnoV4Ft2+Giw5qofMBhL3TZ7U9PZ4L2Bddz/oby44Ttpy9HIMhEBS+C7ypUWB
         kC6pFvvvUbe4haSamvg8d7ASM9byAsNRm2BtbY/zQ0m4udHEVNghHnF7XO7FKumeTYHQ
         wyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KcpyWR9ztcaYoVXnyA8OVvjUi1zJWAvkQ8opvq0mx7A=;
        fh=eustLEVmU2JHEuyzcV0lHhcYN+PtRWsetlbEmj9LDi0=;
        b=XsZDmwSGiUTeVk2+owBibajvAn2FlJP4BZRT7p8J+IniiK7KlrkOaO3vOL9Y6dLmkC
         JjZKxkbIV3bcpCj7pAZ1+mDvTQO3pO/hrd7xHHOL2uRmdr+JgCQ2jM+ZvvgYJxd9lELn
         mQgvc274sSw+qGLEnlkU0jOVD9o0DlDqibuoSCRuGSdoLNuHa7Px4uB1vrRDXZs/AOPk
         56WFFShRcsAhoz1IdX/tiLK6aWPLJy3jCwmlpUWUF7RGxgX5xznLEsfj0dstQ+aAwwaQ
         EUONuDCzIuOXf/O0Yi5/az4mZMp+uY11S/R0cazqAtqyDhi4oDFuYlWkkZQuCInlc6K9
         AzPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779200283; x=1779805083; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcpyWR9ztcaYoVXnyA8OVvjUi1zJWAvkQ8opvq0mx7A=;
        b=fFwMw/Q9FBafbER/5TJMzIKpLKhAkpY41zdy7A4Bv2bnCrWi0WKm+7hojP7sn2NP/A
         KeVncbHAC5p8fLxzJtW07jUQukJQU2iGJcONMC8KCqHVjyxJgGyIEGMspayG/V/BgJ/3
         QUqZXCt9RwOhs+LvnnlAQM8pUIObcgUItFoMvxXQHbqNPHjNN/5Xi2JQvxfk5X/9aZ6C
         8KCqVFiUF8jT6A03FR0HbyE+YriPSM+A+iZs53fnnQ2bWB6rgSdnPj/1QDfizvVN8wIy
         jWcaoj90q/MvxtJTxEdcBT9pifo3a7R/OwdIDd4++sdIMMYx+WJQqDFTzaDYjAU78R1U
         qS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200283; x=1779805083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KcpyWR9ztcaYoVXnyA8OVvjUi1zJWAvkQ8opvq0mx7A=;
        b=Fo9loax/9Z8/U7azIuCDw0mI6TAke4jjqekPtxCpJ/zgJRPgU9FhrALGdTFuYyVJRI
         wL/zPU0aMcPMrL24QA9wxAXRD1siqABAN9y8OjoJltGQl83k0jTFWK3Tc1suMGuPeyoc
         0/oXv00j3LBRJ+8EqHd5+1IzqsFlxb9bTwnLF0nbpU5Peg/Vj/Asvu8Az760+8tZwgQM
         ZM1R4YAnLtSh4Crz8MhEIbfM0SGFtWwT3LzTAu8WUVhKetYj4s1K+Sdy3PihIG+btyje
         YQ7EhgzyPozMzaQ3SKyJnz7grIqVTaXx7zrLHmEGjc2hpjENQkJu5USN97jD6scK9Lv4
         sFjA==
X-Forwarded-Encrypted: i=1; AFNElJ9uak7+utGLKLU5uRWv3bFvX0URs92hog9xMpm6jDDeGW16UCqctt+L25BpZr2Xp8ahNbzckE0je21c@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3fjkz2tsYxvUQlRBXm0wwWBwNiPZIl1MHqV074Qu1p9deddAe
	1XU8u0YXEatlG87UXSYKoWuAPwMKlKJDAOW1Q5ADzIXEI2GKxvgaKHGjaP5It2hK9CZDfls8wfo
	n1upTEEOZZ25K4d/auiHlDcnweI+pj1A=
X-Gm-Gg: Acq92OGpdXFQYnTpwH8V3YrvlSYkX5q1jSnYlDxhP+UCMcm0bxn+uaCqfi/EZZOTMoZ
	bC1JQqEWMNPRbsmfqIq7ngMC7u3xoY4RnhxsqcNAALgT6SzWDfTRrkeUEvHwjYAJPmksvM6P6IQ
	pk4YXwcyGDnOHV/4/Z1kOYjWu6dz9IwDuHYPmzhdPvIUERzgZyq29vbsMdgs5naEVTQizfbIZMr
	hO4st7BI5HTvwcon1hGX12eVYsvZkLydXi/sqnRTEdXuuMlNUEYDWElY+Ab+z7IgX3D14fZgGE7
	GEGF4nVylj3718A1AcIPRbqCqTu7WBvr8hgctEktoR81EWkZn60c
X-Received: by 2002:a05:6402:5cd:b0:67d:9f52:a78b with SMTP id
 4fb4d7f45d1cf-683bd57fd40mr9672772a12.19.1779200282625; Tue, 19 May 2026
 07:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-13-joannelkoong@gmail.com> <CAOQ4uxjMPPp-R37yKoOs1kGUdAOmnp3keVWvfuxi1r8jrxAcTA@mail.gmail.com>
 <agjDGBQPG2WpDTWO@fedora.fritz.box> <CAJnrk1b_55hMTRxtV8QKBqdfEhT_LQK2byat+x-a8Xrj4nicnw@mail.gmail.com>
In-Reply-To: <CAJnrk1b_55hMTRxtV8QKBqdfEhT_LQK2byat+x-a8Xrj4nicnw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 19 May 2026 16:17:51 +0200
X-Gm-Features: AVHnY4LJ3qITr02ccj_9_VFQZZh950e9967B6nCn_Ei3xCEomL4fDgP18jZ8FDk
Message-ID: <CAOQ4uxj+ss82jZV6yq=LXag2s_ax9rVdtH9uc8W+RnRD+U5qpg@mail.gmail.com>
Subject: Re: Re: [PATCH v2 12/21] fuse: add struct fuse_entry2_out and helpers
 for extended entry replies
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Horst Birthelmer <horst@birthelmer.de>, miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 1:12=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Sat, May 16, 2026 at 12:29=E2=80=AFPM Horst Birthelmer <horst@birthelm=
er.de> wrote:
...
> > Hi Amir,
> >
> > I see there is a lot of talk about using the compounds in a couple of d=
ifferent contexts.
> > I really have to apologize for not having the latest patch ready by now=
, but I'm
> > a bit unsure how to do it.
> >
> > I'm not entirely sure if compounds will only be a thing for fusex or if=
 it will ever
> > be accepted for the classic FUSE.
>
> I'm not sure what the plan is either. I think this will get clarified
> on Thursday hopefully.
>

Wait, is there a FUSE call? I did not get an invite :-D

Thanks,
Amir.
