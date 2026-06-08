Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CA03890F3
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780945420; cv=pass; b=tUhGd97/PBeSnDNetjKa/Kj44deDXeN4oDGCGuwGBWH66V+yKmWQ176RHTz0GjvU4dat5AMF3qSRieNsSIMH85McYEJ21c6p36F7js+uK3MTYgr7VXbUEB5x3PClAwXSCHkufOctOYhv8tjerHk8HKN3zY7TEVMmMGjvKIdHVsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780945420; c=relaxed/simple;
	bh=SNkZ1y4krZZxClIq5iX8iV6niB6o6RcqKwOfqFdJynE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8w06a8qYfMr+VuJytSCKZWRiPdpi8+vuSgXee1AjZUEWRQb97HI9fjShylm1BBopczQ2zaWyZT5oWTHYjHcpmDESsVtRq/LjRF2e9Kas8/W/AEKw26VHWoyUMwjrwudYYaepfDi1jDTh25880FVPk9WFx+HMB9+CjwzSax2voY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFt2hgdV; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFt2hgdV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b64c8311so53073915e9.3
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 12:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780945418; cv=none;
        d=google.com; s=arc-20240605;
        b=HwHyQL41eLir9/q5WNZ/BjyQC0v7ZgIrhMCIaF9R3/cFANWd9k6ggpx4k08kbI74Av
         ZS8WrNP8SiRqp9X8SfCWFzHTDL5ckwBy5NbuF7BEF39zS5O1dUMsKHKMYS1GI5yLa87D
         HeedEiH8lYiYii7p0ljJ9inVunWu3xS1HegOPMrzTHJRnSfizidgvxfK+WBUni5SKye6
         MfxkgwGUSlaUY2B362/Nf/mHU0DXZvVykTnHBzleDs9tj6Ss+UEm92PZ++4RNgisuYcz
         5tjTIt76L+weiwDdGdsFP0kActPTa1gJZbndT1EbTNNdyM3DfyeRx0/6WB/BA6q+uDQ7
         bmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JsR+EN3r0h1ma1xM5bhIUs6AZFP10ZV4ymbqUUiYm6k=;
        fh=++lnd9pQsc14ujLpcVzt+eVHi94P7AOXnexG7NK72fs=;
        b=cDy/R0GMoh0vIWNnWM0uI+gZhl3cudTEs09kN0VgBT3IqLNRTtGBzcFRPlGCgHP7Mc
         XDx13qMl6l6IpnUroqHLyIne02KalvimrW3gjiiV4ruZ0kca/fTMHDEQbFvCgPr2AHlZ
         CbemHlImM4ryZRUxxGPckaqYNRv12UA4jMhCgpfW+vdH0IcTkCFrRDyUdVEggSy4FS5y
         20G+LhNK6afa5LybzbtbEri9eiVTRUfxaMD4k93YmVE8XMJGpuLM3sy/pIVtzLccSpT7
         dofy7jbFfpulGFbGsDJjSgFszgUEPdjNzggQtCvRefvo4CPLi5z3nDMLiGNGZAayHfnz
         lBmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780945418; x=1781550218; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsR+EN3r0h1ma1xM5bhIUs6AZFP10ZV4ymbqUUiYm6k=;
        b=fFt2hgdV6fe9+V+WgQzg6ycUIyXfejrCs9kTWOsnpuu9GLufHAYa4DwQc6YL0r4qFk
         fN4lB9D47MB1ghoTz+c2/CC6+dZHCqRlxjKjIW43KKbW+t8IX0ZRTNT+Z4MtPtBMeCs2
         ThXKB/5gRFA2+UHaJ3xquDC2/02lxrVAoMRu5nEXpZ6mMENE5ygmqOPIYeGZvaCPHPjH
         YQrpcnN+VpU8xzCyFSbH0PWmUXRLWOyLq6DgRegWyy0ngpCNiRZwWNxoIZrDqcIN6W4Q
         rWTEI2bSyVG+OFod1MHv3q5bWdZbJC16ss/dE9HUJECCncGSW/9qcfYS1QkeXXLKnCQ2
         uANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780945418; x=1781550218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JsR+EN3r0h1ma1xM5bhIUs6AZFP10ZV4ymbqUUiYm6k=;
        b=Vb+x29K53sWACd+IpCGFBtOkFmonUcejAIsP7Ix7vWcnXwpGivwTiYiWgcobFvTXJy
         pZy2zwk8UBPShKsZfutLp3saVpl/g7OQaioX7LOZyBVYm3Ot1OOYTOuy5Na1y1I2ApCx
         s0s/ao+7wGKFF93gZEmYpdqoXaw2n8VUm2E6SKrBbM0Q17Ok15wntl/wWWUUV42HQnCW
         FLjQau8tAjLi8jsURFpYWqejw59wLcul5A86kmZ8wjPCTC4RO/XCX/wvHZ8WNV9FCooY
         kjSFWe8c5clLMdARB14kkuY0EQGUW32AmanXgEHDBirvzkhnplwW14S5B6sHCcFLBNe+
         aFUQ==
X-Gm-Message-State: AOJu0Ywxl3dOQ2qr9oNWGQH87ULtdyYsqDndvJOOqFhKZmiAOrtl9E0I
	AAQW16za09L8tMe83mfy+s4g8i6qR+utuTb9ozMEDT55y57mux84jMAPoVKv4puvaqUJ8YTNetR
	bGW5OMoLgCNGFuYbvjECqaRjNeo0O/Ag=
X-Gm-Gg: Acq92OGzxw5JO8UDt82wnkFqBTkU8IYZgDfc9SCwLz3eU9kyvSun+TQUhoQj4jQ43LJ
	OG24t32eEDFTU/9lXJweclS48E99HMKjpcsv7DyBGGRIB6n04A+w9T6J/17LGgg42TC9Nqzax1d
	W7gIoM3oyH9YlE/CvuQKZ6m9nOK4Of6L2UTENKCjbtnqDNrDesabaYDY8SOxI8d2qTZX1Ht7Fpx
	UAoaIK1sv99zBtJchPpVFFr08JKBvM46fzuAHqEJUDl8jDIBwqLsyMgywwK8PVhUoIHU56HexkR
	GFEZi1SwCJNz2fnD
X-Received: by 2002:a05:600c:1c17:b0:490:a646:9d77 with SMTP id
 5b1f17b1804b1-490c2591e72mr305204595e9.6.1780945417818; Mon, 08 Jun 2026
 12:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516021138.2759874-1-joannelkoong@gmail.com>
In-Reply-To: <20260516021138.2759874-1-joannelkoong@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 8 Jun 2026 12:03:26 -0700
X-Gm-Features: AVVi8Cc6Rt824eVq62CtePxPuE3jXh0ocsgDeiSXhvZ9QnsPjYdFZeUdu5shPxc
Message-ID: <CAJnrk1bhWbvEirAM-ePgU=qCUJpHZCoU+ekP9yY7p-uSyk7j0g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] fuse: fix io-uring abort races and cancel null deref
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev, bernd@bsbernd.com, ali@ddn.com, 
	horst@birthelmer.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 7:12=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Patch 1 and 2 address races between abort and fuse uring ring creation /
> registration. Patch 3 fixes fuse_uring_cancel() moving cancelled entries
> (which have no fuse_req) to ent_in_userspace, which can crash
> ent_list_request_expired(). It also removes the queue_refs > 0 gate in
> fuse_uring_abort() so that request flushing always happens, since cancel
> now decrements queue_refs directly.
>
> For some more context, please see the discussions in [1].
>
> [1] https://lore.kernel.org/linux-fsdevel/20251021-io-uring-fixes-cancel-=
mem-leak-v1-0-26b78b2c973c@ddn.com/
>
> Changelog
> --------
> v1: https://lore.kernel.org/fuse-devel/20260515045541.1171335-1-joannelko=
ong@gmail.com/
> v1 -> v2:
> * Reorder commits 1 and 2 and edit commit 1 message (Bernd)
>
> Joanne Koong (3):
>   fuse: fix race between registration and connection abortion
>   fuse: check connection abort during ring creation
>   fuse: fix moving cancelled entry to ent_in_userspace list
>
>  fs/fuse/dev_uring.c   | 32 ++++++++++++++++++++++++--------
>  fs/fuse/dev_uring_i.h |  6 +++---
>  2 files changed, 27 insertions(+), 11 deletions(-)
>
> --
> 2.52.0
>

Miklos, this series is ready from my side - could you pick it up for your t=
ree?

Thanks,
Joanne
