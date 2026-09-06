Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B137D282F1C
	for <fuse-devel@lists.linux.dev>; Sun,  6 Sep 2026 01:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788658366; cv=pass; b=iUtufVQwrg5HNEdK5FTS0lDHKk0hzHR0vKN4whmSYdgFes6RVo04KjgWOtj/GYdTpx2/nzwCrzmW903OQOKEP/vDjWZZD8tG7+PQ+VN4Du7AHwR3quoOBNiW5mx+/HU2CkTN9rgwz3u4d54kaa9qqc5viGA9n0V8ygCv/a2GDOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788658366; c=relaxed/simple;
	bh=XkGisV3Evjj7Mvd+zTCV+TdTT1vDp/RPTN9iZlFQXP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFn8NiTqE716wXaHPqyk8MjinRZT9Ys0LNl55GfBeddBmpLIhd5n/rE8djm3yR0YzlfXXBOjUkZPmk0evCg62hZWqBo0uvgoHTWz5Db7mctXHO/OrdC5oN+CFaCm7QMQ9EckTC1n9+jDSNMlkAPQkoZzjZG50C8OLs+gKVEWih0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=EPThJFtS; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="EPThJFtS"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-86265451beeso840768b3a.0
        for <fuse-devel@lists.linux.dev>; Sat, 05 Sep 2026 18:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788658364; cv=none;
        d=google.com; s=arc-20260327;
        b=Wh13qUR2hvFeoHcF01t4UaOf4UKJPirrv5MdHaVuDrQNXaHbOfAZ7AdNnB+7jjUugY
         DOBhQAXfDePCWO4+FbVkbUX/W9t4f6g1iEZryv+05lkk3PtbtR+lij489Z9JPB6iaTGd
         Jgm06k0zvOYnUPAC7j901fPeEXwDZH59dJmPlai0PmeKxROvYTp3UlXZKoYiwyOtZN+3
         CUMJIlzR4ZMq85AHO8XPwEOsJN4KvE4hHhJdNJN9F8k6sHWQnHOzTJe57xgrCPM+DutL
         BL9yWAS/I4XIS+g3Ai9UdAQV817rU9rVrfsU0LKA8qlRUOn21d6zc7yjwye+euL19u1A
         o90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5c69AaY32kskBXaaf974C8085cag74RfiCzN2LO7Q78=;
        fh=kyqRgwAUjMkG1MxF0v81xNFA//+qDqa2xvM0hSRcgJ4=;
        b=YogHyDNj/Xr+54jKK3S98f5DSNnfkHNc/2H+PhkoikY6kiaSTnWZpvHkQCZH+1hrSz
         rKHyeoSasrvtqr5bpH5Ock5t8KfmDtOhFMmd6kxL7fkO/a3Mzz+MYLSANtD0YOO70t7Y
         jlFV4fjIs8joBQ+rdWJzKzYP3PEM4/w8RRrrxqX4en/JaDUkhkwOy8sBVD0jsphjv7/D
         fCYgTX0TzQYcdAXNsHkbQx1uRvU9qKo8ULdYHW9tRzmbNhqRsUM2e4ow2Zj9eCBqCiYJ
         xtjdxYDVfwiCAcaqOM61OFANqEBY+buNa5URq0UEkIrtBy0cFZgVFajoZPL9Di1p5Iih
         8IJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1788658364; x=1789263164; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5c69AaY32kskBXaaf974C8085cag74RfiCzN2LO7Q78=;
        b=EPThJFtSCvB1+dU4ct9HJNzwkBPiO01aoN9JPyJicKc0791Hvu3V1LvXLRxJOwwyc9
         XTNLuY3ub5VrsHP0+5SFElya4QIij/aJYLvDTZY9X4Z/FkrzNCv3sW/ubID3ItdmSi9y
         vuxbyKHb2LBe8sPL9Q+vd5JrzlmxYKnAYx7HaKIMA+I6n6c76p4nt2GuXl9Nzx66lIqU
         oRYPusa/jZUIgI/sNIlUf2rgKy29zJJRZPuHsiPnrw56o63o1LWmo/30sT6Wq9UoVDyd
         A1/AxeEFWYlPxGyGZKea34oZwv4gAwdBpa1GpNIHmWlrdScDoEjGVpYuYw5rUV8ZQSLz
         /TuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788658364; x=1789263164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5c69AaY32kskBXaaf974C8085cag74RfiCzN2LO7Q78=;
        b=bN2fN+2QkLtMHThD25i+IeuFvsPHnQiZ0/ntslxaAJqeHIbGr6Av4Ed0dS5usxxAxE
         Hx0AtbXn/qWQXkGYpEv2UoVncgv8fo+mKyVJkkjYIQu/l522PVlTmSvlModoyrsEFomQ
         Fr+9GI2ZBbrPNcA9UBmInq+hkn/Crfp1e4/DsNBCZesq/uOwQVRutLOZpRXS6ojTaSbA
         VQ9IYsipYmHng0I9ywUewMnsESrTLeQ65XxwhvfJ6+1cGPDrBkFPtK/iAzUMNP/0JMQK
         0i4dMFtEGFTTroVCTEdqcWrCb6O2fu2ulafISR1U3Svi5sl1qCaZOwWv+yWX6ilpz66S
         uZSg==
X-Forwarded-Encrypted: i=1; AKwUvBzIl+Mzyl0AOFWuvKnP+nAjbBH2CNhcao1rnmPP6pE5AvpdGyRSLfXQxbwdpxJ+94vR9qOijWdfwZJC@lists.linux.dev
X-Gm-Message-State: AFuF++kTIJUmQ4ww6EeHOA+XPKeAsmkLt2FbhGMn1i64BNAzomUaJdl7
	UsRtKGZWfu6KqCigOgFs2KzBdX0AmpjxuHcpl/3qQF3nJgLiHg5DoZNP5tP87TSR5luZCnhUx5W
	7BN16U4+vUvKgrmI3xTQZ43iWLKh6vqgRfnsWQtU3
X-Gm-Gg: AYBFou3b/HSZck4yylBmeyV6wI7lVsJ44X544nThHlrrHb0FoeMl3qFQxZHx0Dw9YiV
	Ui08ck0BTytOrbFpVDGyMgZKGjQvAEzq4y6Nar6CqE9E/dnlvCW3x5GNS66b7hphs2IytoYdCWl
	lSLgS0P8WfG/ubMNXVJlzAdeXtRB68wvvwJ9NjkR1e55RMd6msPt5jnTvTvo9fxcs11K1liOZdN
	a+AS7hiNG2zUX1IKTksMeJeocEGS26iSkmq5b1CVihiPknuhmEYw4rWAxig7uM/Cqt4gvPHsmmM
	7mlXITC7IAyZChk/68tETHeSdzIqIab+Jx7ZBX25nci6TapXeJqzIs3WcFmyOR+tw3t2gXy0B5l
	zYr44xGU1WQ==
X-Received: by 2002:a05:6a00:2c94:b0:857:727c:a1f2 with SMTP id
 d2e1a72fcca58-8616907f6e9mr21628645b3a.20.1788658363695; Sat, 05 Sep 2026
 18:32:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727233706.218446-1-xmei5@asu.edu> <20260727233706.218446-2-xmei5@asu.edu>
 <CAJfpegtvYJPBt=AcssH25mn5VDR3Gdkhf1PvuLR5HkJ=CmkYpQ@mail.gmail.com>
In-Reply-To: <CAJfpegtvYJPBt=AcssH25mn5VDR3Gdkhf1PvuLR5HkJ=CmkYpQ@mail.gmail.com>
From: Xiang Mei <xmei5@asu.edu>
Date: Sat, 5 Sep 2026 18:32:32 -0700
X-Gm-Features: AcwNN1UPXRzFZw8ZZGT_UcW_OJxAT5DgOQb9MbK7fu1zShy4ZYp6C_Z4xnhZ2ys
Message-ID: <CAPpSM+RgWtmFLUAMfCvCg0ek0z-fSLAjr-eCVYivv0z5tKNVxQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] fuse: bound io-uring payload copies to the
 registered buffer size
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	Baokun Li <libaokun@linux.alibaba.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 5:28=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Tue, 28 Jul 2026 at 01:37, Xiang Mei <xmei5@asu.edu> wrote:
>
> > Store the registered payload length (payload->iov_len) in the ring entr=
y
> > and use it for the import and both bounds checks, so the buffer the
> > server provided is honoured and an oversized reply/request is rejected
> > (-EINVAL for a reply, and -E2BIG/-EIO for a request, matching
> > fuse_dev_do_read()) instead of panicking.
>
> Can you please update this on latest fuse.git#for-next?  It looks like
> some of the checks are already added by Joanne's patches.
>
Thanks for your help merging 1/3. I checked the latest version finding
there is some changes to these functions but the check is still
missing and we can still trigger the bug so I rebased the fix and
dropped the review-by tag. V6 has been sent for your review:

https://lore.kernel.org/fuse-devel/20260906012924.1928316-1-xmei5@asu.edu/T=
/#t

Thanks,
Xiang

> Thanks,
> Miklos
