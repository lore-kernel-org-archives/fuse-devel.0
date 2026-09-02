Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433063A257F
	for <fuse-devel@lists.linux.dev>; Wed,  2 Sep 2026 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335177; cv=pass; b=QsSYcahgGoO0vBf8Cm5Nufaw/kxbsiO6vpsUxvzLh1Gui47dfN/bLzMDQmGrWWjb6r48RIOV11t48kIj059EX7VHE7mJEXozdBfgp3T96RtT9dPC/PeOvdfw0ofcko43vqqJgY9kIzrzrZ0Byz1st7TZsOK03Wp8hunWx8fTCjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335177; c=relaxed/simple;
	bh=Ff42/5Zin2A49xGekI+VoPU4wwYez+C35cPmEHD27Io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucRADfloaX6TGADbTL9Wlfh6N3UE8RnJtL6NhqKNEH8c8Mp0LBJXUfmmYPlAmOPFVjuEQUr7iv1EvQLViUhUk1vxiJGiCfwZWNmKFNemnkdHmH7ekOP/OUbpSyLldZC5cdq980PNIEvL5tT86QKNdXUGvhIsAoiOnU8TmwUpLho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=RHflQ7u7; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="RHflQ7u7"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51bfe810293so5908701cf.1
        for <fuse-devel@lists.linux.dev>; Wed, 02 Sep 2026 00:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788335174; cv=none;
        d=google.com; s=arc-20260327;
        b=cJF8Lm5kEum3WPXgfJJIHK0lK5PNUTPq8CbDpzOW13vBAAgcmk72UbHJvVQGj/NizA
         Wi3OTfCgtdkbeqgGhOaw951ASEIyAKUA+shc8LUrhaM9DGNI3UmPMmXT3wUUCsHAzeKr
         oUxwII6BgFwk2B3ldFuuxI7qW4hVnVeeGXLC4Hp3LMyl1SJNE/VIKobDhtUSwGGP78wW
         NdVoTr2FPv6gRfnPPWV4hWY5B+n830BLmDqYnvcK+trR6T2kMuwlB446l4MYA4ZU77oJ
         dW8jNhV8lKbm3/8N4Vmfil1V847TvDsjNRFndMKr/4ESaAvmw+dPTrYXQVv3GoaRpxTu
         /Png==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IvhExhiWnI8V1WRxlxJqXXVBUw3gqvoomsk9oVMgNog=;
        fh=Tk2FYNAsmdBkbR5afDUFMHkddhF0etQlTt4aQPJ+0jw=;
        b=BRVzMxF9fWZS+zX1e1/slNocEtcrkYcFr8FqVgNrUo0hqcr+XMwriDgq+ka0VBvS5E
         ZCENHtRZ2rJlrcC1v6zNYikdKtWu12MhS4coQjIlLBSdM3iB6Fw3QSPm1dHE/3pHcOfO
         VPYuD/SNvfnPLqYw3jZDu5xMU3Cskv5euwTTZLxwNRSwMP5WNhY+kQJ9QMHrtUbo15Fx
         MQYLw+3WUeD0GNDScyp7NBaBz6AXic62c93HpU/vy9KIlr1GZBspNnPzIC8vBI2GOqT9
         CrncS9rsHYPaFqyFq1/l65Y7u7a7GQues6Dm95asXhvWsesCGTMpGMhm9UpY9oHNZugc
         QkTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1788335174; x=1788939974; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvhExhiWnI8V1WRxlxJqXXVBUw3gqvoomsk9oVMgNog=;
        b=RHflQ7u7j2QjpjLSvbC8Nrq8eKIpkAtnHowBSTpLrLnaiuUlaFi5WJueiUa3i0SofH
         RGL0ajiT0I18iVkZUn5lVEIDjMg3Itp26bLXDhjewN4PlgKTEmaSNruPvVv/blsm2dOc
         pIWcrPE6pr1z7jXf+m/dh+Ao3dkWN7PxlNHiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788335174; x=1788939974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IvhExhiWnI8V1WRxlxJqXXVBUw3gqvoomsk9oVMgNog=;
        b=I5Jfgp0dU90zpNMbD266tBNuOXbLKteB0FCqWq1wCrorVd3BJcu3JxvrcKb1VcS90p
         bq6Gzk71jJEeDUagWKsiEtLNFCEBH1LCF92NAukDxPothTHJrV3ZjLFbpRUuSJDmscNt
         xGV8aVqkTixKehleRjfiwmjUsMyVItYJWJ0DJMUs49aT8uvUq8YgQN8tah+OALg+hVMb
         gCxzWnkb8CZDUfB0Ij7hGWBbA96jjjxZS8DTL2Q+8VHXib/ZhGuRdNUK+pstOG6CKFI+
         uAEUtOtxjVGQAfm5Wg74PpPUrvEGx3LmyTAOl4JAtqnUKyoGidkvtgJr/rVy+6G3TPvK
         fwsw==
X-Gm-Message-State: AFuF++lc/VUuxHy5ybwhGCtezFqXXrA5fwAAWTIAynJ8VMeYpT1HVntl
	VLtyjOKW+5qKOuO3tcikVp90FH2V+pEBN9Aa7G0tlQPHCdjZrbmWoyGpxWmZVBdA+T4/YbaHHdc
	nyKCc3dlsRW9QsaEijhTPS5S3IhpnoGKBnIE1cJ43Cg==
X-Gm-Gg: AR+sD13nEMLEZIGMeMf3CtXSiUPIh3tIkGy/w2GQFUaLodSQVv7zUFB/FxcBgSXTbVg
	NIRmr4i5tLfAjnlYnhy5p1kreI8kCz0huPM+phtZjkYNT2UyRsK+2FP2X2bET7makNPV0j6wLjm
	a/hwRJy88Dkqqg36+WZF+aA3EISVChi7+rfqPofFxfVxPWRXce0PuFdtuxbmwEL0fTZGmNDrtH8
	uffhA5XNwDxZIoWdMWaXvgrfWzBrcS7x019XNgx6QDmpzL5al5hpfIzA5bCUHpE/+mgJeFRAyeb
	QXYkX3L66gLHuni7+jHcziCVcfI1cTTrC+TmPUzMpCQuqKh6iO2NO5oBOll/HPvGwauq2+39MzH
	ZVOdUKDLlrnw=
X-Received: by 2002:a05:622a:14c6:b0:51c:f8f:13d with SMTP id
 d75a77b69052e-53036d70d07mr26470561cf.37.1788335169278; Wed, 02 Sep 2026
 00:46:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901213412.1763253-1-changyuanl@google.com>
In-Reply-To: <20260901213412.1763253-1-changyuanl@google.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 2 Sep 2026 09:45:58 +0200
X-Gm-Features: AcwNN1UFf7VhA4ev-1okF184xxRRDQXQHWQimzIKZ-vmP1OFAqzs-nCx_0ZY4jI
Message-ID: <CAJfpegtWYP-q82428iHd9gOBkAmoB=mgfGZRs3oi2FiAm3W-yA@mail.gmail.com>
Subject: Re: [RFC] Handling 0-sized pseudo-files (cgroupfs/sysfs/procfs) in
 virtiofs and FUSE
To: Changyuan Lyu <changyuanl@google.com>
Cc: fuse-devel@lists.linux.dev, virtio-fs@lists.linux.dev, khazhy@google.com, 
	peternewman@google.com, German Maglione <gmaglione@redhat.com>, 
	Hanna Czenczek <hreitz@redhat.com>, posk@google.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 23:34, Changyuan Lyu <changyuanl@google.com> wrote:

> 1. For virtiofsd: Does the automatic detection of pseudo-filesystems via
>    fstatfs magic match upstream expectations, or would upstream prefer an
>    explicit configuration option (such as per-path cache policies)?

Why not just set "--cache never" for the pseudo fs export?

> 2. For the kernel: Does the proposed copy_splice_read() fallback for
>    FOPEN_DIRECT_IO files in fuse_splice_read() look acceptable?

Yes, in fact this patch has been sitting in my local tree for a week.
 Pushed out now, updated with a link to this report as well.

Thanks,
Miklos
