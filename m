Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD723361959
	for <fuse-devel@lists.linux.dev>; Thu, 27 Aug 2026 20:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861134; cv=pass; b=GBCk82aUnIjf0CpSn8Q17aL1s3xgH4iTBAAoYDz9HoHtjYBp8OeawwaANwvhUmV+FTa50ikwLC3MMQWzHZN6nMm6WbAoFWbqMXwuutFP4fzqnp2Si7+drvSJ+OWmEa556Ojh6qY8B2rWP21IyjnqNuirT724NbdLNy8dqCzPaF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861134; c=relaxed/simple;
	bh=Amq2Nq7g4Rvhi+A8MmnZy28GeuV84bebu12tbajvslg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkR/30dY4eFJpeVS7RHh7Oce7KkRzlaEzcl0Omv+B6mmrKcJ2E5aIPjxlgwIUCVV/SQS+gDKDBDD6snp/a9CAj5VUxNd/+q1vaqUk9VEvbKC9dmKgwSGZaCueT33aPDdGiIFHZTsuuwJ3Ln09R9qd0f0IM+Q2qBiMUbF1jvghII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6vEZJJ1; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6vEZJJ1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso1599855e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 27 Aug 2026 13:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787861128; cv=none;
        d=google.com; s=arc-20260327;
        b=W5FW3FhB+NDIQ7MlI05ANmFSPvq6boz7/mzhzNrdzeoun6M2mT6Z61Ks/X35HywG63
         0tlZ5MopWlPKuHAfLpVMadH2wJs/i4KF5shAKPRaTxv6SUx/WUeHktVpNazN22wDhbrc
         RcGhwFzupjdCiO69Wd7ks1Otd1GVmxjbAHxllAFHlbUCiTSEX3hOiDdZl/vypub9Fzxq
         ws7pg1IsB8ObD98Ab42MSzMfBXPXYXXNxRixS3lp+XW1MsKgoctx2gBycNF6pokkEEy6
         tq0xGM/SDKCF8S15HO7H0h02DW5fOW+u2J4kdaugf1odH27g5yEKbubc8Ox/GZF0u46I
         hKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIsnd6xgeWrgcQT3jCCMdd8DVWxNR+Gr3QkvZG2o5wQ=;
        fh=NoyJoZKhMkkA/2YqghP4ufLcRl4xxIKGs4uhw2zD7Cs=;
        b=A/ds7/GoOaHyGwNCQsc6S9IGO8WQRktmVJll7qERcgDLOa0pT5nlhnunIvakAwcRXJ
         CbPR08pCODgNHjUFoYmIIerZhMedDjpo1Cj7wz0BhSXaIoMD2DcDZFz5sedJU5flInA7
         wnyv+gSQ2d8RHyfsiDvKKRjN+YRK+Vtl1YXJIDKYL+b+km5fcKCNbzSDYWTCfqCQRkJY
         +zH0tUKebTnVCT2Kw2UaZNmEfM6zYCXJA+MxO88xLiyehYyZBbLWTXdBUwTH/W+XWaLe
         MvUNPA1pwFzAxW4ZmO3WDB0Dovke0aJ58wLJhTsjUp9xcUaJ56BOLGsIltqW7zhZuExv
         AeTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861128; x=1788465928; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BIsnd6xgeWrgcQT3jCCMdd8DVWxNR+Gr3QkvZG2o5wQ=;
        b=l6vEZJJ1mh3qGoTbwu9jHmsjaZnK6zhN8l94DPEHI3myE7LyyjLpLQazkE/CIySKlM
         CgfqBXxXbUYVRpl1tYWO7Kruh4tmdayi5wcz9F4sQR9Kg3Adxbk10z4n/L0skQfDwTlK
         Q+Z3mgnFxklxmQzBo+0OR6gsu3IR0xWzgMmL9ow6ohILG1qxvdSekjll1XP7N4s5XCMg
         y8k6oToCbpE+qeQ5ofK+ciHxovfDhlR7FMMyoHzH1LcGb9Uhh716koU0dzNAYAEMQp99
         E6lkyuS93Rpuo2PBTnQTRdqZtAJCTohwruzr04jyXkelZ7F9BzMfglgOHnYt9qmuCTV7
         NOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861128; x=1788465928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIsnd6xgeWrgcQT3jCCMdd8DVWxNR+Gr3QkvZG2o5wQ=;
        b=hh+KZN+0kqPL1/p4JP3NV1UB7NrMXKy8WE8SIDaas4/EW1XyWKPx70CjqwAotq2ESN
         LtwSeCWSb7irHomjDdE5zv7LhkpS+VTwauvl70WICmUx1qt88lRaPKEasUWNvvW8qAjr
         l+hlGJ654XJ5dNW4Ye95lwCCSyRUNEo5L5RYkYJh3QHqH4geJlIucEjcDUsliCSFTw6p
         gfeKWU7OXH+R8EsSTmNnxRf+TJPdDayssMeI3j3YOL21CCW/wDzOxu0t477fcyPzMSAe
         +sxXSO+p/wGT+1qXSdt4Zy43bsP3+DNK2I50OahDVeKXVBedGBsivjsRIIRN3HazqrLT
         usEA==
X-Forwarded-Encrypted: i=1; AHgh+RrqMB1zkz1KJojjOcrWLwiwLzJT+8xruLuvz/BldqAsrANHZFO3gZGMf63eJTi3vYiKh8pxnOONIwrw@lists.linux.dev
X-Gm-Message-State: AFuF++leM5laI2Lg6lhGvafSStnM+qC11ZJkbHOTJOXIK7G8nxuM+lnh
	FIzn7uGuqiuCqMgOu5BHEntY6R2Fx5uCf4j4vwkL3EeP3sarpyo3vYDD6tb970SDIJoVBBPCAQn
	jbqa2VeAdu0kTaN31xwuzvvwUGpC6Yx4=
X-Gm-Gg: AR+sD13uhfUMq27M01jLRJQemzWfSV4bMPkIi/2kNr5tfxmXqWKpqgGyImnaA7kP8du
	E2eibJbLwiwkalo5euq4cLFgzZCY1UQj80QmdAhrggFCtdF1h6LXPaxFoBjRMC3+3I5wm7vtNu1
	pglgvrPtcXGzwL0XDXpuC4c49RmxBqG1irjjCsamwPZafGT2ot7vRNu7E4Ia8NtFNUdI+7rrYFo
	lqeqBDQDU59uJHDV2jMSijv0gizHhW+UAAgR5tdUntFi7XaIZxnoE2z+K0U153I6bTPKW73QE6j
	evMkPPN1Gb+r1mw98PVuf84jNspZoVMefLgqlrOPiA7ua2KC2YJTKdjlC2kKkD4FU0K/g2U+jb0
	0kVFBg8Yu1mQmjsKUvDWx5eYDrNM=
X-Received: by 2002:a05:600c:c4aa:b0:499:d513:e507 with SMTP id
 5b1f17b1804b1-49b91c17d72mr16962265e9.2.1787861127504; Thu, 27 Aug 2026
 13:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827185722.3234622-1-csander@purestorage.com> <20260827185722.3234622-2-csander@purestorage.com>
In-Reply-To: <20260827185722.3234622-2-csander@purestorage.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 27 Aug 2026 13:05:15 -0700
X-Gm-Features: AcwNN1UExlY2vL2SpJh0tNQapsYMiZcr3z5sWaZZFYGrbWrJd63x35h50FR6wzE
Message-ID: <CAJnrk1YfTg-Lz+TmM+c=Asc8N4QGuY9_g8zUXtaNr4O7hG1Djw@mail.gmail.com>
Subject: Re: [PATCH 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Ming Lei <tom.leiming@gmail.com>, 
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, linux-block@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, fuse-devel@lists.linux.dev, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Caleb,

On Thu, Aug 27, 2026 at 11:57=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> In preparation for setting the io_uring NVMe passthru CQE results from
> the blk-mq request completion rather than the task work callback, split
> out functions io_uring_cmd_set_res{,32}() from io_uring_cmd_done{,32}().
> This allows io_uring_cmd_done{,32}() and __io_uring_cmd_done() to be
> consolidated into a single CQE-size-agnostic function with 3 fewer
> arguments than __io_uring_cmd_done().
>

The conversion looks logically correct to me but the interface feels a
bit annoying / fragile on the caller side.

Is there a way nvme can get what it needs without changing the other
callers? Would it work to just keep the existing
io_uring_cmd_done{,32}() as is and add a separate API for special
callers like nvme, eg:

  void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 res2);
  void __io_uring_cmd_done(struct io_uring_cmd *cmd, unsigned issue_flags);

where io_uring_cmd_done{,32} would then just be inline wrappers over
those? afaict, then only the nvme callsite would have to change and
fuse, btrfs, block, ublk, and scsi_bsg could just stay as is. Do you
think something like that makes sense to do?

Thanks,
Joanne
