Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0153F4908BF
	for <fuse-devel@lists.linux.dev>; Wed,  7 Oct 2026 12:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377203; cv=pass; b=f+UUH3P3ohbesmGCorzdTyU1JXlqThgJ60949vgnMoLpeie6GGuxIb2cj9v2Qw03JwcLaiHu7ho9K5Fw8GeP/UszuYn5ltVMjK9CKrYyRSerkmqf+1rLqKvnmuCtxBZQ4SRveen8y12d61bp9sMs8UAzq5SKFvJ6UcoKXmyvfNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377203; c=relaxed/simple;
	bh=DQ66qo2LBVsMUtYcU8ALmcwIh6GNxRlKIPrYYWjh+QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWG15Eus+6uiiwp4s5crG9eIP1ad3LQvRxv41p4TSi0QLY4NSnla4DjuzUl741YKSMoIezI8MG49ITFJNx+HoXFPAkIJW0rrVS3XKopVA1VdE3L6wQnVeV8EgPWg24sRNQHFoIBgru4eob17Dtl8FMfTP3XxI3Y3hRtoyp5tQKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=nnAYqY7e; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="nnAYqY7e"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917a7c03eb8so31269996d6.3
        for <fuse-devel@lists.linux.dev>; Wed, 07 Oct 2026 05:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791377193; cv=none;
        d=google.com; s=arc-20260327;
        b=YoL2kzESdQvKCjoD+cJw5qgwDQ2hzzfI+PJncQ3bTTZuRPtx1qIfdZpXE/ajJqtrPZ
         A+OfSr6Q9Mgde+ApNdC1vnImRWO9ndKEwOA3uuGMDKmJobUEaCGzM3edXn8FDQcEM21D
         c22u8OpsnY1sZa8Ycmao78asBr1RaH4/HzrnZW07pBw5No5Z2VCseaksOsxuerTpPOhV
         A1Ag+ked9D0QfGBEmBaBT3Kqc1+394bPMbaBvv4dzdN9cOH8YVqeMOCzh2TQ7qOyMc0Q
         OYG+VSQCCSNplzTYmh/8ubVUk+cGopyMT+jA2cWeooLHBYmySDBT41CtgdqjbeGzS8PW
         9sLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dUNhGKEa9s44b6qdRqUnNpXSObQsUXKjp/BQgjN+C1k=;
        fh=k+1PeRX7skRVHNDdAz5bbzd7CA1HYPTdzyJO5i7Sndo=;
        b=DauNiSs4T3kSD7CokE8mDcmitdlIonJFH9bj9C/YfFHBkKmrsgwfhlQ0eQB2DNUqBc
         dHIJjIb+O8arK54wh9P72vtAFeyufKFKVejv8YqTibeHuVSGE0VQs6vcrjcajsroPpiv
         LfdeESyz9NlaZsdtCc041zPKQjYKvqSeiegC12bkdiZ+/EGk7SUqTvQLVOwaxnNZG/o2
         5+acZdThy02FOzLsx1eyLE3RXQI/YEK8fHo8Al0aC4wm0oEZzu0cLGg2/oXaXfx9g0VJ
         5k6E204KRqB8XidN+2w01Co9f4nsgvhj5d7aGHMN9Y89NlX67We68r3ChStv5vJfioiN
         xaUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1791377193; x=1791981993; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUNhGKEa9s44b6qdRqUnNpXSObQsUXKjp/BQgjN+C1k=;
        b=nnAYqY7e7g2xpmsNmoLx1SyiS++scdYqd270N1eE1c+BYvhkRuARMUG8HXrNw9GeS+
         NlxhtB+HDZ2itjqVJm5bpv2LTtwTFS8D9QTuv9FGSrfU3k4LnBit0Dte80jkRXqfF33D
         6+EcqMAbAlM+aKpTg+Q1SNnRwgGM39S+2B2KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377193; x=1791981993;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dUNhGKEa9s44b6qdRqUnNpXSObQsUXKjp/BQgjN+C1k=;
        b=L+9cymH9s/HCtzSHn8F06oHG7LyECMllO7NzN0/KjnF+PcL77axFghjzEn2sdISBvM
         5jbKeTcPlFXNCHkhwC+0sEQJZUWZwucJX0eSGW2RB8q2F521A22g/z/XOIa+C1g5D0SD
         9JulWj2D/IsnnxES1nA3DqDpCgU/UdRPY72GY6mAVcA5EcFYGBZFEDxR8i6B0MhWOggB
         bpGO53s8uwD06nMJXo8U1xVrJyhC81Fqrkk0QeD0UUOecc8hAVEyckk5H9YUAq5V929v
         XPIK79EbsnKZNuCwxkdH0nL23mVA40FbOpn1Vu56ORx4RKPd2YkQCZrkiQcn1sjt0Mxo
         PgQQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6boe5c+ZYClRZ117HG54HG2BHaJxubNIbj6e8XQKvE22vO9oVhWiz+Vu0CPW2OHpDvUJ33qhdvWwh@lists.linux.dev
X-Gm-Message-State: AFuF++np7LSOcebak2a/AIDdxPxk18SkwvbmnCVS0bVFzsJY/HHwgEDJ
	WOFXBnbKOEQuLez10muAwz3jwd04Kzv7NBc2Tam+ctR3/Y+E2ZKYHXb4WBB+gV4GLd/gyBQUAGu
	geH8XN1s5r/Gd974Z/JqoXHUNmabfJi6KzZb4Tz3VNA==
X-Gm-Gg: AYBFou0/6ovjXz23s8MpJS8+hb9NxGzs2ve7GMaBJcmcDLkx3Ml7rFKHl4tTwfFjPDU
	ct/Pn5D1ODuwMDI4zx06wBJqf7Tr3EOf6OOuHLVpm/f9Jn64c8GrpuDeuHAfza7YhpE5qVVWJa4
	PJPtopqzYw9iuv41oQCrbg+KvV4+T3flkHp1OqfWakgdP7gxVQkykJgrBruiDyEd0wV9R37eTsd
	Psm/gpqSTMHC0qjh37mhWSEMwDO99owc6sUtGDZ8VFrFV+1Xhcj3nr6kEE/OsfraOfUQEzXTwTg
	HQ3ajrtemVy5ZgnUO2SCQRtz4P300fQlsLe5NOOgRSPYHsTEBbQlwnUndtUM7Qn9rafdIwEAaNS
	cLdXp/1rSrQ5k
X-Received: by 2002:a05:6214:5992:b0:912:5f4c:ad3b with SMTP id
 6a1803df08f44-919977eb9c7mr39837396d6.16.1791377193347; Wed, 07 Oct 2026
 05:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001150935.655979-1-mszeredi@redhat.com> <20261001150935.655979-4-mszeredi@redhat.com>
 <CAOQ4uxjWCRs59Qpc4t+2=i67rdJkHt=+rH07ZXv7ZzAvTjTm-A@mail.gmail.com>
 <CAOQ4uxi1+WgHJdnRKMD3tp24EOyx7iPByzSKLn_siTVY3_sRDQ@mail.gmail.com>
 <CAJfpegttAHQAGhE61t-VZqfQv9Z==ovbyLY6qp3KOK_CvjBciA@mail.gmail.com> <CAOQ4uxj76PJiumvXLHoJUKx_=FAueg3WQjYd64=B_TXo581POg@mail.gmail.com>
In-Reply-To: <CAOQ4uxj76PJiumvXLHoJUKx_=FAueg3WQjYd64=B_TXo581POg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 7 Oct 2026 14:46:21 +0200
X-Gm-Features: AclHuK_kiKb8PFtEuseEkzlQkRsY4kgMloE-Yk2LCuIBBYBmhlknL6iE41fdO20
Message-ID: <CAJfpegsKRX-sumEA5bjvfNwpkXp35HM_QPd8taMPooR0gHpKaA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] fuse: support 64 bit, server allocated backing ID
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	John Groves <john@groves.net>, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 23:24, Amir Goldstein <amir73il@gmail.com> wrote:

> Unless we gate _open() with fch->initialized, then it could fail on
> either one of these cases:
>
>                 if (!fc->passthrough || !capable(CAP_SYS_ADMIN))
>                         return -EPERM;
>
>                 if (inode->i_sb->s_stack_depth >= fc->max_stack_depth)
>                         return -ELOOP;
>
> Quite randomly.
>
> Maybe I am missing something.

No, you are right.

Thanks,
Miklos
