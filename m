Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0F4416D1D
	for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104489; cv=pass; b=WWiupTiRvpWQagWNuhF1/+0SCPkhnriWx5eV6jm9vI0wmVLF1j4qrPxcNAr9U+SV2RMUCiZO8slfby+1rMalXgpvujT2onKorb+coLfbcyiADoIH+zSA96/9OPRvplc/g8HQP4uA4P2G/VY3NmW010LHFSqO38VE93yynVrzk4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104489; c=relaxed/simple;
	bh=zCFZwQjsRoDM/qQvl/gnkxIzzbwxx6jgdZ2HFLfaoik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gw3hq7INPdtXT5mpyZCgemofj0KkR2xBfY0TTZ9maHPCclHA7wsddevZqfQpOa80MEOlqjTps5oSgJ0jXzCmJz4Zkqc743aA1iFiKxpiA12YzPw4rWCSdG/YTIIKU0UIpl2jcC+RpuWVpnbirijlI2Q+wdhAOqIs12gzXemZW/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=KdfE3avD; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="KdfE3avD"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-517583cb07aso73545531cf.2
        for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 08:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781104486; cv=none;
        d=google.com; s=arc-20240605;
        b=Hro5zLvaoql3ucIFGo3BlSJGBquTkE7BYWmn6PXCebTBxtx4aJrixK3GRRJnXPwjOG
         H6R3QMlmN9BbPAOUNyk5CIqyXoGM4yeJbgDiKu8fJKM4Zq5QI4YeJ70/V0Ofihz4fVGK
         XsbbeFWtBok4ZM870ZRDBt2t83sldjtIHGgb+AVvq/dWrxCNFdBnPz8AMYFoSVJkBOHu
         pkxIgzy+dion8izOr52LqvSRJ3mKz1K8dp/qr7CeAmc3mFqVty4wFPbIa2+R8ruujkMd
         On145LZ5i2eZQwDbbBhcr9cdfNPpul8qoSWZXCOaD4TnwCoqXS1tGsk99unq15Ce9PxM
         K+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zCFZwQjsRoDM/qQvl/gnkxIzzbwxx6jgdZ2HFLfaoik=;
        fh=dOTfuVpupQUnmYjTbyxraj/gwb34rLunwBpErcKCwYg=;
        b=FI7vtLW7uO9YyVNRUR1rtKMirGex1A6AMD6EgWI5BQMX6kl0kom5tzYpprYIuju3wB
         VDstJcvvbEOkxSt62qVvEpePDR/1ddcHuHqo0C4tRcvu0wIfHnWxMSTQaanqCQCtpAGY
         67y9JCOmA768DPZ/CGAl3IRjkZj3Qs4qhME8CNS5lhJ9CEWYpyulroa759s+Chs9Vt7X
         SxNDje+WauxHpO8qOPx/fwvzUgivjs8q0zc+1vb3PsNfBEG0Ai2RL1B3MVizNeQqp5tf
         lvbj0GSNevNB/Ki0YqQkC/bgi25vtPTlu7s9RcK7cdCm8L0Dmy1T1iOLZhq/jaOaAmyw
         /kEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781104486; x=1781709286; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zCFZwQjsRoDM/qQvl/gnkxIzzbwxx6jgdZ2HFLfaoik=;
        b=KdfE3avDYu7NW836wpu9ehb5AEiGjxnu+dLrbajT259s7N2vVEQiHWsMQpKO9RullS
         a7pCld5eHVx6Qy60AJeyLxogUWABnvg4+2h6LYcbhxEvn6O7dQ7MPUmta3rc9ngXpNlV
         ATT9U2ev1jS75XjcwoEdzd/i7/BigSqNcNG7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781104486; x=1781709286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCFZwQjsRoDM/qQvl/gnkxIzzbwxx6jgdZ2HFLfaoik=;
        b=YkIQDDHQ7ZYIRN2bJHKQ+JNBXp3akRB6Zmyfvtq2QCDSrTaK2njaCMm804tnTFsSa0
         /dC4fDYgFTAsneArMS+RLQ8EDzADJKulUKIlFr/JatT2PMAukSBQcFWdwmc+Qx0A4nCq
         PsxQqnO0JT2ugBYR8/21H5l04KVGZpEEIQtkx5SYrljZzy6v+LzTVd7QeKTp58/ANgL5
         p8t+Bp7VQiBZ/1wvjUp/6z+XW9mehYamAQGpvjoM3tWBYocFkb15Pqs47eYKnUM6Yf6T
         0P9LFZChWtsskSDBImKXxU6LAoDYdrCTpfC0mGjbem7JCSz2/jPjF9YOzD9OauDAGaxY
         eiTw==
X-Forwarded-Encrypted: i=1; AFNElJ8en67vmJaIBl4SeDd0LPuHfy4Q7NC50j2HcQU0hu622F2dh9VKoEREq4p/FoTRQnckm/tvj6dHNsUc@lists.linux.dev
X-Gm-Message-State: AOJu0YzJdi5pV/vR0gDAZWPCU1QJrGhNZjydOxpZcLEwXQs3zfGS+7cB
	R8OWoVvHZS0JcMUmfNMiFeTjfUNO5nPrNLZLMPaBgCIt7MgEScCl6HABhOu0K1nwwgmADoEyb+1
	3cIJoadja6322/KKhP0Lo8e2by1UwbPe1LGhxvNOmiA==
X-Gm-Gg: Acq92OG0Q/hB9F7cYuv/ptpZykHZImEaegEmkUY4PPoWvHk4jot0BIKB0CC8itbeZw/
	RIzqGy1MP5EWOkICxk7N/IdHZAldq9Rl0737NAp72a7WB/ZV2QRihcAoy9Dgm13hq7vayg7TptE
	hg9jCvvMv5JVlbxUOY9yc97qFpTdGADoSmWzGbMR553UzeijsQwn7UiHzSj5wWZh+sgYiT5Xamw
	yDx+6NNNq9o9FohyK9heJ9+HEgeHGp69E9r/dINGHChdGoEp722bjIukZaIVYIzZmAV3/QOcVYG
	CkLvPe298XagSXWkZTQiFWT5Bm5LLLY1LlgdUfVuYHW3jV/TC3VvdwuoEA4v4Q==
X-Received: by 2002:a05:622a:2489:b0:517:9570:c1bd with SMTP id
 d75a77b69052e-51795bb170fmr388899121cf.25.1781104486017; Wed, 10 Jun 2026
 08:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
 <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com> <CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTDkCigNKRt57JREJQ@mail.gmail.com>
 <6ecc45f5-4bce-4af2-bfe4-36c69e624b01@bsbernd.com> <CAJnrk1aS=3KwZ3LpiqcK=gKsj7oru-k-1Xpe2j5puDdmn+hjUA@mail.gmail.com>
 <CAJnrk1aacCbOWWWvW2xnQZ0a954-4shXdyO9LBn_Fv_dyUAWnw@mail.gmail.com>
In-Reply-To: <CAJnrk1aacCbOWWWvW2xnQZ0a954-4shXdyO9LBn_Fv_dyUAWnw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 10 Jun 2026 17:14:34 +0200
X-Gm-Features: AVVi8Ccw6sxizv-IKyFkK3j5_STF3Ax9BHzvtSHI9QaLhqNmgY8ri2oxToQEXi8
Message-ID: <CAJfpegtorFv9u2NCPA8v5OHiBUNT-XzUiw_y=7c3U3WEaXRUZA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2026 at 00:07, Joanne Koong <joannelkoong@gmail.com> wrote:

> In my opinion, passing in the buffers contiguously as a pool leads to
> simpler and cleaner logic at the fuse, io-uring, and userspace layers.
> If a daemon wants to dynamically add/remove buffer capacity in the
> future, they can add/remove another buffer pool or another ring,
> depending on their workload.
>
> From Bernd's perspective, passing in each buffer individually allows
> daemons who want to dynamically add/remove buffer capacity in the
> future to add/remove capacity one buffer at a time based on load
> instead of needing to commit upfront to adding/removing a pool.

Isn't registering a single buffer a special case of registering a buffer pool?

If so, the question becomes how much complexity does the buffer pool
add compared to the single buffer case.

Thanks,
Miklos
