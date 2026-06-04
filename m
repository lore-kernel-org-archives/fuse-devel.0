Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C75280CE5
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 14:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780582183; cv=pass; b=V7Xb+y0LsxGq21O50BjQJGW5HZH2KJ6QuWed2llMdbwhrLzi5RfMk5CKg4oW/yM6t5jB3fSkxYyR68A2WF1JuFmnpfZKTOlv8stWzCHiOySwW2D4eY3KCu+PlNoXK+oHs9buCyTKePiQE3AoBrRVZDF/DPqcIBzsPt3bgOzGw/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780582183; c=relaxed/simple;
	bh=FWrLTfIezHHV6bdbo8wEPlH1ravV7EnEvXRXHmJDXLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgFCoTJ3SlIBmGicJJqmJwvYvHDF/XQmdTDVuLh9CGwWZozoP2R7icv03MKrqVJJlj03qqr1JB8f97/xt6RuprbTadcuiHTYAGEk69YmN/Z58toFWmveFYGr9jLXLex0THYmYp4AB1M57xCvWnzkKsJBBTd9DPflhED5IOfFRzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=P+o2tGNm; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="P+o2tGNm"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5174a3a025aso7086091cf.3
        for <fuse-devel@lists.linux.dev>; Thu, 04 Jun 2026 07:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780582181; cv=none;
        d=google.com; s=arc-20240605;
        b=WFCBOYLF5nLgKOLgOz7nft4lL4WFoltCNNkm8eqOvbKpsOqN3m4jgHeW7k+AKuH2CN
         BluV5HuTjm580AjPOymij6tm5CJ0hZAF1ppwcVgIlIOLNvtS4IdlqwZjEJ68pvRHXPq0
         usH14MzDPB7DxNlWUKI0b91tv/R2+f2+j79Ygx2eT78/xOcrIv/DXdcqv0gInPgb7LKp
         THXa/I2Q7D5X/6spBXP8bxFz32TNbL3ci1dEyFyuLG4Z1gA+lzpimwrhLlDMM0/n0szt
         F9hWWkpHTh+pTHG7cB0jJMJvhprxahFMuFqYbDkiNhH3vAcuObiVpLW/bVk8Uc07WXQ2
         HeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=98FPmbhpLPJM/7zR853zuqkdkvn2YZkHMTwfaIfPgDw=;
        fh=IsRincKgRXNfuEkU1e+ULghMo1bcxIPN4LnnGMlE5cU=;
        b=fGKZ72M/W1HKHTlLSSxw/Zv5aU2f1NJMTujZ+s/fmay7qNkKINsflW2gWT756Y1FYD
         zVtGKROQ57oHHmnwVp53DJzsUVppOY+AruYq9bY6GFaF1erWBd2HbeG3gMFYcwQZdieq
         OhYlzN0xtvZ1IV344Layi7rKJj/Qa7Aa/O95V82eQevhyxuLm6mQlW1sLP0ZFzHej4aL
         qOF0RvWbmiEqlW+ApTBG4UM4TbWIWUEmm7tfPQ5TYp7LBELE2LePWng0eNZ4m7jzFshm
         qdoohQdoz1hWVVrNK0FrU80OVFI/2stvMo1Uk9KM6GX36Fkacidx9YQHHsaN2PtrVD2o
         ofLA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780582181; x=1781186981; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=98FPmbhpLPJM/7zR853zuqkdkvn2YZkHMTwfaIfPgDw=;
        b=P+o2tGNm1aQvVf8ZAAe/L/ePR9/6XALQmoxN5LR1i/7LP6NB+mGHy7LYhUlF/JsIEL
         UIeBhSVQhK+CHAzS5z7K9Ts3VNT1IHXvWLbigESyMK/e7NEzB7yr/xLWaic4nDVeR5yA
         7Zn5MUU0IUK1ZrohpYmOG6dHkRBP09+o+JG4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780582181; x=1781186981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98FPmbhpLPJM/7zR853zuqkdkvn2YZkHMTwfaIfPgDw=;
        b=X4STyZ0afHu28TpovFcUqSNnb/Ie3cPam0q+OStQsbYo3oz7oGzlAyyVE8cYiqfhw0
         SBWRmVqh59IRjWNEH6cok4VWOJdOJaVtPPSewm3AKYrL2jr3C0K1fMD3NZ+A8C0AOjjl
         wWSMw+mexD/am1zFIkJjDyrCEMgKK28aeUQmRJT8uHKX1xJg+Iz9PaqS80FPD2DwZT4i
         AnYpFxDivfSsqdGK4qj58jmMMtzD9r396e9X9HD3LpLjfKTlIP7juH0qP4cnjcNLje8f
         l+imeXRSIIFRY0oCjtuDx9tAKIzGOcCGcx9ks7H7yg0rYi1b+cWfsscxhPvT9iZIlqoD
         vMcA==
X-Forwarded-Encrypted: i=1; AFNElJ8bXIna26VuHUEgR39YOQiOywsKcSwdg8Zo1ip4DiILI3ImIfAP/RhPbmSdEOLlFm7EpYzj+NNNRk4e@lists.linux.dev
X-Gm-Message-State: AOJu0YxIKbrc2QjMYfk7eMRsIeqqb5sIWyks+u01z5/pILDw3GHLG8Vp
	3bX/bIgjwVIKgqNJVtH8kawQi5NUXORnyftQISa/6ZPZSJ2vQ09KP6wri9gdGc62QAWvgLR3eFB
	qoom569VJ3dmXHpDXOZfvJTxH+P/2jQqt76JiOWIypA==
X-Gm-Gg: Acq92OEMIGXpKvs4m1WfvKk4nbob1/6tRug9dzbMvtnJUUjaONERzehELBIRNznHVQS
	DBpGiXd7hR1ywxNJ6xpINf+ymrX6DC3pRj1IW0PFNJDdxchfhnUY93+uh2HbRxUMdZSVpDh10y9
	/3LopQ7HHRifPQuMD6E0hl7Pm94rTi/74fltIe0It8uABg0HQyagV9iC/WlkjGSoi63iYWr6xzo
	l2gl3FB+a0yERR57eqQHTypiRtinyXviDtZkJ9ub8SLpcSpGbWqsxOjBMUIWE8j0tbWzzXhOW42
	i4NfpP3K0QiOtzO1pRh6+x93oB+yHKNDB38wngQOTC33JbU=
X-Received: by 2002:ac8:5ace:0:b0:517:8f2e:5d84 with SMTP id
 d75a77b69052e-5178f2e6022mr18814601cf.3.1780582181512; Thu, 04 Jun 2026
 07:09:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601152327.2069787-1-mszeredi@redhat.com> <CAOQ4uxjFg4rjwGjU2LvZT6AhC+gBk_6Ej5S4p4DKuk8=a71cRw@mail.gmail.com>
 <CAJfpegt5Q0nmK0JKAfa4Bp_SydR1qiqu7pB0JKkXSCFOYSVDDA@mail.gmail.com> <CAOQ4uxgc_pW57_xeHjm6xauB3Cfx3ZY3Y-NaXO_xvL==vKcFOQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxgc_pW57_xeHjm6xauB3Cfx3ZY3Y-NaXO_xvL==vKcFOQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 4 Jun 2026 16:09:30 +0200
X-Gm-Features: AVHnY4LyHhg64celmgzEtz2KBQSkvIzUmA8zTzW76PPPmG_BU1hVxiGNUOLD-W8
Message-ID: <CAJfpegsiA9A8tc0w4JdQ52k2qMr9UrYFF3PRsxRTd1PAfhf4Wg@mail.gmail.com>
Subject: Re: [PATCH] famfs: FUSE_FAMFS_EXT_INTERLEAVE -> FUSE_DEV_IOC_STRIPE_OPEN
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, John Groves <jgroves@micron.com>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 09:39, Amir Goldstein <amir73il@gmail.com> wrote:

> struct fuse_backing_map {
>         int32_t         fd;
>         uint32_t        flags;
>         int32_t          id;
>         uint32_t        ops_mask;
> };

Or make backing ID 64 bit (same as node ID, can cast from/to pointer)
and ops_mask be part of flags?

Thanks,
Miklos
