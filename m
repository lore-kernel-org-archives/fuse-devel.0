Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92E038B7B0
	for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684560; cv=pass; b=BJgFLWBlO+I7DLJbcMV9pfVmp602pUxtKe6D3kEXR6UkvL+h3wIGMUPMn5ezKKOVDcLO0XM7TId8AvQnPqYw0wrUKleMgrsQMrH9B/L9k+k+xQnw4T+irzNpZad1aWJBdtvrisF1yBarqJqA3howU0UfX5paIe0AEQ0HTOr34jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684560; c=relaxed/simple;
	bh=xvOTAcL/OEi1dP4MlZ52ki7wL7tL1sQQL7OUhgqBmNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RR39UkoWxeVVbXw+s7ng03zH7fEmy9TDaagA1Hhofs041vXQTadniebcKm7to5P5VmCzuksoX97xgxqBCw94JNy+0DCpGQKkUIsbMPbuXwXmArf+i2DOxJHKaVnAwsMWpxIvIXyzZmJvhrHr4U+QiQOX2xunJeXr6wOSEkLG+wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=h2g1ZjYa; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="h2g1ZjYa"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-517dc520840so59281011cf.3
        for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 01:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781684556; cv=none;
        d=google.com; s=arc-20240605;
        b=My8h+ssZyQi+1f4bd1H5tCdKk1YwFRMz8NhbiNcJuWjX7akZWjw07ZRMTK22kl8K0z
         dMKu9q47ebxFGPEK2iQzaNBab3lGweH4EzxsWyZSWmME4vV/FIhjhDrc89SOEq33Z9zd
         2VLrZTmBgEJlFy227Wr+8lc2hBvzRj82hgRmC8SF1Y4JUVBdnsAPplnmN/45EFcqmgui
         6ut82VPG4R+CtY5r1BVop6sUgiZm+SbduQAacRsZmuGbUCSLgD90NQIwn3BuAjavfnQv
         lV+XSE4DZgu0Y0rv2HnkRJ53GJdxdnZDSQzUSW6WD+GlLlHDxxnoYsZ46Hs88oj2dR/p
         O5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BU5fXnVq2Oqd0AAAN7spvlRTj86TwPYYP6Lo343Jbco=;
        fh=/ayxSprbVnal+qi9czzY2aY0tcf9jBUUcSaj0qcbQTI=;
        b=BJh0qn2t1vR14GjSbWhmyZKTnLDc4EDtuLhvzSJe8oPlaPcH8sKWdKrlOHVL5al5vU
         0cZOJGZiIijPtS1/zKdFf7prYlVCPtHMXBH3EX9J4LiGBul5lxncsqg771eyCUTS1PmZ
         vGk2NAvcC/7sD0auVM0OPaSiq2Rs2IV+v6ePL0MR8uY6Rz3+sumoG8IbBuMdHOcTMauc
         UFHmxExGFJV7EMp+8Kkt+EV1om3DtqxvaSShXAhX8XLC2qFCC4yEmrXgTMV4fIjSw92h
         YTFGnRTEC1JLpEC3KzO0eCRVyE6JH5smkzFCOnHSgfxA+mmRsRpIxMFs38lGnB53xgNn
         A6sQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781684556; x=1782289356; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BU5fXnVq2Oqd0AAAN7spvlRTj86TwPYYP6Lo343Jbco=;
        b=h2g1ZjYabTFhgAuNPTMydkWYf4aZtebCRNYlE9Io7WS3kuFi/sElR32CE+8sHvAugm
         unBDutrtIbKKRoHXcJTu/6J7NDDEuLIDNFYnaNSqYbSgO7qO9kt+dJ6vLMlZg0SEZm85
         itQuXEyVAEZSBctXROgrUZFTQz11UJdbmRWX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684556; x=1782289356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BU5fXnVq2Oqd0AAAN7spvlRTj86TwPYYP6Lo343Jbco=;
        b=Ag1Cfdh4dWKfBcAQ2F4XIcv3qo/tVqKkW3b9RJrU34XBC4biCkmCycXGWpWmA8leZo
         2bZnXlTbwk2/8H24gLFafJxrWGcfRbDErh900w0QzsTeYrzWr6fQL8L0lqtZ+Vz3Kvww
         p2Q4Fp8i7V11RfoZOBdFy1VMrsQ+D4aHmra1PLHELT+8Bcb2HY46egKZ1r8TjlHh8xJG
         QspGgMlczU1vt9KMR67FqfVXtP2PVrvj9kw2OyS8iL7bh+rx5LsYBrs2Fpa8dlxfy/2l
         XDKTTMOhjAdzkcaNoe4Vu2RsaZBnWQuo9YobivSitUTGRURJCtkiFrOpxudh+NT9dL+z
         S5OA==
X-Gm-Message-State: AOJu0YxC31bCKnOUDKVehY6rxJWBHpTYe+Nf0eCoCzJM0O0pErjzc8nu
	yivUsIfq56xP7oMDWCO0+8wleFl27S0KWswjFCuYF7U5XG3mZ2hWNBpdTNETI/pHSFRAZOCe0W1
	I93pvZAvvBuLdaRmg7KQxdFK98NqPS9wQ7zpiYOUDrw==
X-Gm-Gg: Acq92OGPuG4wkVS4ezHir9LA48xVhwxCyfBPFfx0mUfMhMOKFlhiDfj2qTVJjgjTspg
	yQRuw7+1R2kUezJKhGBRstXY1VX7e+zevVQH//gonaAr0yhL3uQWi2DMFmAq2mpsfri6MdvytCE
	T9iJm/+C60cW/8LfGxhKOuuof4Tklw9/jIOMnF34PvBpDvHlrvIZo4SYpMLk5X5HOdQP3fPl180
	6khmQv1Gh5wAQmpty6NB/YvoAWiydE9P4fXMsgOY63swbWqiTYpeQBrSJTgguvxFdkHF1tCJIvi
	lF7NPNMYX5UtZsr3nG39jJCvR8Q=
X-Received: by 2002:a05:622a:5516:b0:517:97f9:78f5 with SMTP id
 d75a77b69052e-519a8c6606emr50572071cf.10.1781684556219; Wed, 17 Jun 2026
 01:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616151909.916667-1-jamz@amazon.com> <20260616151909.916667-2-jamz@amazon.com>
In-Reply-To: <20260616151909.916667-2-jamz@amazon.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 17 Jun 2026 10:22:24 +0200
X-Gm-Features: AVVi8CfLUvw9HEz1q1LlF1z_PcpL4rUpzyaGd12mSg8e3Xcq01aL572WH-arImg
Message-ID: <CAJfpeguaa4U6Tsxh5opeaLeYQQxP6MQsRMu_JATJwwgj=OBt3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] fuse: allow FUSE_SYNCFS for privileged userspace servers
To: Jimmy Zuber <jamz@amazon.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jun 2026 at 17:20, Jimmy Zuber <jamz@amazon.com> wrote:

> +/*
> + * A server can stall syncfs()/sync(), so only honor FUSE_HAS_SYNCFS for
> + * mounts owned by the initial user namespace, i.e. set up with host
> + * privilege (like virtiofs and fuseblk).
> + */
> +static bool fuse_syncfs_enable(struct fuse_conn *fc, u64 flags)
> +{
> +       return (flags & FUSE_HAS_SYNCFS) && fc->user_ns == &init_user_ns;
> +}

Sounds really easy to trick: start the server in the initial user ns,
then clone the mounter with a new user/mount namespace.   The
init_user_ns test will pass happily, since the server is running in
the initial namespace.

Thanks,
Miklos
