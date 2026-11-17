Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.222.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794934031;
	b=nq6TUEobnkn5a5loGZd5gEUL+IaWU4HsnGsUEvsihYI+bnfz2NHclclQ5ILnz/NHzsMJ
	 kM86jVTmVVSYpVY7fL0CFYE939ygjdpTIfTo3dKKw8l1LIR3f5XX8eUqLwP6+4+5LJyEs
	 WWftI+WgCGNnKW4VgAczsjPWBhRrw7pMrYh73taxxMacoekwEw5zPNDuRcwd4CF1wujwH
	 rUKNt46IER/tSAjhUCYFrK2fbiEbFGvHlEGAfFtkukshEETMCaTy7pU2qKlh2AuOSCIK1
	 1075G/EVqeeKLUIGA5UGMFWAeNDRhtZ9DEzstleoUgtIuNoZ9ufRKZCSEklWAbRbf1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=jd6+ZfKNXNj4bzpM1N39t1xeNHZL6yxdxFvAuL1XklQ=;
	b=dQRB2sm+tBr0xA8PRIiDvKF1g7DwHqPfSSBOPDqV1M2MqIg7FrTV7ZqsXjMoFsZzpyR/
	 qjAh/zDSXRZQtkmgW3Bgcap99qmEd359evLq3RPQk9vd3B1AhTxIyUfwl9TfzZ+D6EOgj
	 SrZSKZDrb7iuYDVXCBk63gxvgpW1CQH/uUieMgTXhJHcxpnCcbGTLLS4uANQXzeP1NaXD
	 fuj15M4z3n8gqToxzPPMOPkbQ0PmSjFZWB51+9iwBmKJysMu7wOhxEFF++oskJfHpYW45
	 1R2NiIWaAnr/BzEnASw1NmX9lAyBdJGMkndBRl56Q3ffJc1cfHSBuBtn2Wc+BmaiMAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=C35z2EfF;
	arc=fail smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F14606A899
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 16:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F14606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=C35z2EfF
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-94958650b09so6325385a.1
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 08:47:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794934030; cv=none;
        d=google.com; s=arc-20260327;
        b=PHt27JDYubmV3oyMsPu2tRh0f6fZ9sRMvVSvkAryf5JiDBwpqCZcJ6oq76eTixO9+e
         OhphC6Paee9h5QihTADWlrJiKM9PnlIvtXLQR4L5V7dATAolg1IIt4/vcZcQObwm3bxW
         fCvrAkJrwQ8dnKrur9t9bcIDBniNocuSES/kpLVbiZeMfqHNA+bjJMiVrXmqo25aUJUB
         oQtwecfuMjbM5nqtCj91d3NDjJbz7Z8DRDRCF9Q++nZ+hQqboNVh2ZIX76QAQUQS9wGO
         lE3b3PVlQUu4sYp61quGIV7hbM6Dy+3le7AewH0VCO4ThzWCfhaf61K8+j5MS71CTsXD
         1j+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jd6+ZfKNXNj4bzpM1N39t1xeNHZL6yxdxFvAuL1XklQ=;
        fh=wDZn5RErVjqr83Q+fbUl28e8/bMplLAL5nOqoAchSgI=;
        b=rbI5o8nccrTdaH2kzzkWEXm9J0qHZZIdo889IQqmT+0xy5d16u3+rXA3q2pVJ/lQOO
         66VS9tgWwUG+lY0BiaVoxGpzHP3anmYmnomyP75j38ANZ+5ZvqHZQvKQtd8SlOJdyikw
         mDbPLYYgpl++9i8KvpKvJcI2+NUd2sNb1u4hRJ42zDb7RnMp/ioTyvI3JHYnNgRR24rf
         aSNA/UumGAcQjZXZdgOlRBjQg1TcPTN+T2aCHHFssu0Yk2pntdh9OYtOSWNq4+NvBawX
         DaTOysQDfC8hjcVvKzXKnWcgg/2ULWE1tAYmaAn0qx8bq7pxKzp8BMiVJ9Ips+daKw34
         ltbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1794934030; x=1795538830; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jd6+ZfKNXNj4bzpM1N39t1xeNHZL6yxdxFvAuL1XklQ=;
        b=C35z2EfFt52zRbS6dOQ9xUXRYYKqoIXy68eqoTFOda6McNXfn2QdEPlMzwGSrCjiOV
         9m5Tr2It7PPNaLsF1vDlca1WWaX2ktiMlwROjGDQI6p0LI/xARM86LFx0mxWEM+2xU2N
         JW4OwOj5a/lMh89uyXBX5G8ezDeNQCkIq+i8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934030; x=1795538830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jd6+ZfKNXNj4bzpM1N39t1xeNHZL6yxdxFvAuL1XklQ=;
        b=EZ653eQ13dGyvSj7vyKXD8D0j2HmjVa2fwEj5Rq/JVvHGkxi/TYri+5O4nBeX11DRt
         2AdvkEd1l6miBxevbIKvkL2zSvaFck7/8LtDdSS6PPOrjyZ/0WZhVsdTJK6DRtd9xejh
         EKdsDfrXAnu1hKjY7CgUd87TOl0xKkfIJdox9u73PYw9/eTsyTV1L5U+B+plTyCqzvh1
         lMk0156XXnF9yWtCG8NmqCioY0v/BMxxkyI725iYo7oZD+bWKuJVFnSRpe8nHPQqwXvk
         irJEB6eBE3vWlQx+PZC1z3q6ZT7lmXY0DKLom7isqCZ8j6HAICISulSjek70wLgmmPAF
         inag==
X-Gm-Message-State: APuU4Z/skoQZt+6hGa742yEGADSdZNJtfZvaiW6kkV3MJGtOIqf2o0Mp
	JdAFjcYH0atJegT4nQBwqraJJXYJjrffElaIyzzlhNvoClm76p943sPjAZPAHargNK831NfWk86
	7xORL5jwys/8OcPCr6mwV4lSjg16AuYu6OLhLpLWL8Q==
X-Gm-Gg: AYBFou2lhW6EYaUo/ElOfx4f2Ph7p5oHNKEcnm/+IcEKDOGWdam1IoY+F4IkXisMrbm
	6zD0Ne1mNvxG7hlzAfHGlUelGtg4UQbZUrdBobBt39+G3+4PO7LBkPFlyIWO26Twl5bREe+A31V
	AbLtzeC4A1OXBT+mW0NtM7gyy667D7GL8bqcWAhuzsYQ+LxfoIq6uDq2v8lza1ZCscT1r6CtMKp
	UsgpqbYd+IYLiuwTJlHsvp8mIGTm8ZDxMj/KWLVOXbSgPYh0TF+dkSr7oE+XnTzqjMBPBt4RJW1
	L9b9Dudmwr3TxpEZGLMJCXnyklc8GyKJBt+4NGwPqiKUqKqjKK5BuOxO/qrlhnkVg5J4+WU5+Jy
	X2JlrRvKETjyO9BJIEB/bdFUu5XsFBDL44iolgvu44ECi7IzsYoKEjVtL/Ay3vGKGM1TK52kEyu
	jEPl6XgWSbmFM=
X-Received: by 2002:a05:622b:c9:20b0:55d:36cb:d2f6 with SMTP id
 d75a77b69052e-55d36cbd522mr82984791cf.8.1794934029641; Tue, 17 Nov 2026
 08:47:09 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261017094601.3434882-1-hengyul@cs.unc.edu>
In-Reply-To: <20261017094601.3434882-1-hengyul@cs.unc.edu>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 17 Nov 2026 17:46:57 +0100
X-Gm-Features: AclHuK8wmcKKsdp4Cx0Jb35BfV53xmf2JhwPHldvoPOcuRVA7GxYXeCz_kxkfRg
Message-ID: <CAJfpegtmi=SFYeX5YSq-Lch+FbkP4NszUTnnuwj9Mr9A11=eDg@mail.gmail.com>
Subject: Re: [PATCH] fuse: preserve ENOTCONN after failed initialization and disconnect
To: hengyul@cs.unc.edu
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Oct 2026 at 11:46, <hengyul@cs.unc.edu> wrote:

> Record INIT failure in the channel before publishing initialized, and
> check it in fuse_get_req() after waiting for initialization and checking
> for disconnection. This preserves ECONNREFUSED for failed INIT while
> the device remains open, and restores ENOTCONN after disconnection.

Applied with minor tweaks.

Thanks,
Miklos
