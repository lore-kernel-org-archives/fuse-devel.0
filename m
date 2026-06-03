Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B86F423A7B
	for <fuse-devel@lists.linux.dev>; Wed,  3 Jun 2026 08:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475749; cv=pass; b=ijjpVOCsAXQMvp1qba2M0mQoBNX+28S0kqaBrR+l7wwoecrQipsCyOMLaaLZWZ4dLt+vjGN7SR5biD7tIZwOF/ccMdOUXOD+OYX/KoNaiF3kzpjJS5W469jlrT0DKmImEVkKmUegf/5sefrbTe+8fiekAX65HfDa8qM8yo+6ak0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475749; c=relaxed/simple;
	bh=F+m5EHKpzyoeMU59zGslD7GYnl1tjf1cNbhiiQSb2Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GVJjzoSXCA63+Npjd3laZmNK4bONC1wV+B6OkRoVwaWE2StNMT6ajw1imMSYBNFXbT2IPa6ZN5ikTkseKwXQJISPFja9HsQJIf+se4+QKGdqVVNUUuXc1M9pJZSHvTJzpsZ/I/sNnYlx2HMjVpxE49wBNwl69Y6+WBiedo+ajn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=auE3sG80; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="auE3sG80"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9157b94a07aso205996985a.0
        for <fuse-devel@lists.linux.dev>; Wed, 03 Jun 2026 01:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780475746; cv=none;
        d=google.com; s=arc-20240605;
        b=A8WM3BR3VJq2rroBX8erYa2poZe4WKO6R1w79r2TiHbhPefxcH6l+4FWl4YQhvmEVv
         cN+PXCR9DVPSWEwGH3NnLeBO5irAzrtHo5X5RfSGkKa1VxguQM7g03DTbWaFQq59rMg/
         ZVRHdzCfmjbyL5y+wD7qvcSI6xXiltb629qeG7ttr9ff5/C9kLKgdc+duX9suQj/B3+J
         PNxwwUTVvGHWpGl3Fpx4GVSyAbBtA0wqWvBmcGKMX4F9t4HL/spQBD/PqzWLoZNXMpxd
         x5yrh5V+4PV8zd6G1yEu7K3rwI9zVLiCpl4B3bWGxSQrXQwEMNRynaRHOR3G+6yTdk6j
         YEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kzfV6mTnz6ECoQk5vDbo+2QOxcAXNy7XpAQeuH7cpGs=;
        fh=NhEnQQsp+XYG8e93Ouvn6IqpVZ7l+tjiFaNalu2K67o=;
        b=XPdZ2aXrsMNHKiQ256tpAFLFzWlKcC7yFVnC0mkEGg8sdz/OITwuaBFm5TrUk1lIp7
         ZjyBzkI9EKBROwVHbXasn6dd5UmkEwCH0XVsoPEZ3HyVBUwtsXvA6TaO0BViIkO7YKds
         2JZasikEHc/iJ7G+BGTQIMGWfGp7v70NyxUNcNJr1le05FXYjcFTefqD2mYWhuyYFJiH
         ChU/BPaQzbHD9GGEpuMdEe5FlWZ09Cf+H35W7akqMtuXlMDNySsHvdH6SDsnzkUe8rli
         BIf/eRiAfGTwYERN8GkpxlMElobTDBQxKiR1kIa3a1pU9eRYLKab59ItywvmQgXHJFlu
         fuLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780475746; x=1781080546; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kzfV6mTnz6ECoQk5vDbo+2QOxcAXNy7XpAQeuH7cpGs=;
        b=auE3sG80NktgqKQUsBycgr+NYeeQ/8AHT302mhsWyWZkajq4t1MUCKNdUK1PaPQEVu
         D6UmGG1Tm2cewpGgb9vRDPR9HCPJTkMp55PUaZtRvzk8Wp/bqA61lc7BG0wqXgXQOc/D
         8MZcp7PtVdRn33Ci563kBnb4zJN3H680JxkJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475746; x=1781080546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzfV6mTnz6ECoQk5vDbo+2QOxcAXNy7XpAQeuH7cpGs=;
        b=nBQWYAjb8kn9k1PPEwYihkBdUz3MfbrRS4lyGIvrQCPLkeQaWFOjAsOWMDh7+LP6LV
         lxmdVywyK+yIouOxD4GIIS8NaGm+FysipXY9vxamJXkqjDXrAkeXFyNoZ5rB7l/+VyHe
         r39mC5MiiMhVrMuKfL1mPX11SzOcQr8tcq83ipHSPT+CysL17aMlQDX9RQaWtWQjNpbE
         TuTXQWYWrlYjsaZhJDFA3JlhNsvvKE+7tsk3N5zl/FG8CeM62kaBx+axi4DwvsSsy83L
         TL91M0ktdFQq3yG9cfXbZa0GxzakVUiRw091wIuvtXDsdmZT/QAZKB3EonnohZQXJbn5
         ngMw==
X-Forwarded-Encrypted: i=1; AFNElJ+Gqr7mkjMtUNgw+kZxyS9MkWjLtuPXjcj0KltCUTqhIRtejkyPTbDC6QUAS9wy10hIQJTtY36hyWw3@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzw+sj5wkERAtLPpMhtBvBJ4gI/mkJWMChdqyI2fm83od0ZQAG
	sndsiOr80yCB8upYd80Zwm/u7SnmtDVBEpQ5+FVyWYQnPIbEfv+QHGMJbc9kVFOYqbprog/F6eL
	GKVTXU0uulqZU08t0haC8MnAcLKnXSK4Xl18tAhWROnaqUETFcYeVWRVS+A==
X-Gm-Gg: Acq92OF//zPZZw1kGkDoes4zX/O3742aZU86Q3yFstT6N6rWqWNmeL2J8U/StCwX3/i
	yVzHpAdHdMEY0E8krOLTaV/c5pelntBB1a4gfwfVyPImHiPQOtWyICYvzpwD94mAAg4EwQikyQe
	bVKeTzOVfWMFLYxCX0iDPOOQVcpy9BIhD25BWfcpbV9XQY/Bb9wdjZLTtAR3Amyg/ttLiCJlCit
	Sss185oIPokaCN5Y3/XbLmTW03D0z/ophhLXojvyN2jTMNZKq1kVMN6zZgDSz+vwG0tIh0z08xu
	HGOQryfvs66oqT+Zks3UNmCLEWbTG9ykvbqh/glwYMOIYlc=
X-Received: by 2002:a05:620a:2406:10b0:915:6c4d:d74b with SMTP id
 af79cd13be357-9158a7aa7d7mr296739985a.31.1780475745859; Wed, 03 Jun 2026
 01:35:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529134302.1989958-1-mszeredi@redhat.com> <ah5-40YypaswEG-1@groves.net>
In-Reply-To: <ah5-40YypaswEG-1@groves.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 3 Jun 2026 10:35:35 +0200
X-Gm-Features: AVHnY4LoJOuscRkWjd8EUUrhDi9rqZKzqt7J6BHlC-LkQxfSmJwdzae4FAaaqHI
Message-ID: <CAJfpegsJj8cZ=CXL-VGeVDOayAeTzstWJgvQye3N+sudHJ5L9g@mail.gmail.com>
Subject: Re: [PATCH] famfs: FUSE_GET_DAXDEV -> FUSE_DEV_IOC_BACKING_OPEN
To: John Groves <john@groves.net>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 09:04, John Groves <john@groves.net> wrote:

> Device indices - the part that has to be right
> ----------------------------------------------
>
> Everything below turns on what a famfs device index *is*, so let me make
> it explicit, because the patch's model of it (kernel-allocated) isn't
> workable for famfs.

The backing ID is a temporary reference for the lifetime of the fuse
filesystem.  If there's a persistent device index the server just
needs to map the persistent index to the temporary backing ID.

AFAICS the only case where this matters is debug messages, otherwise
the kernel couldn't care less about whether the device index is
persistent or not.

Am I missing something?

> Identity by reference, not by path - this part is right
> -------------------------------------------------------
>
> The genuinely better idea here is getting the kernel out of resolving a
> device pathname: the daemon hands over an already-resolved reference
> (you do it with an fd, from which the kernel takes inode->i_rdev)
> instead of a string the kernel has to kern_path(). I want to adopt that
> - credit where it's due.

Name, dev_t  or fd are are all just ways to reference the same thing:
the underlying DAX device.  They are completely interchangable, so if
we have an interface that accepts one, there's no point in making it
accept the others.

dev_t -> name:
   readlink -f /dev/char/$dev

name -> dev_t:
   stat -c %Hr:%Lr $name

name -> fd
  fd = open(name, O_PATH);

fd -> dev_t
  fstat(fd, &st);

Thanks,
Miklos
