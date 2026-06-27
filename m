Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B5D299931
	for <fuse-devel@lists.linux.dev>; Sat, 27 Jun 2026 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782580236; cv=none; b=PvRGEtEONpVsKiPBoa3QDg5mDD10m2RZYShYWg4dFXbw/ILlPx78+22FhsEoLq75guzVe18Y50Rcz+CvV/v9dIKF5dAExFT+koiefVoCyg8xJigOU55O0uvLTgX6+ftfG2ObivwtK77M97oRwBamUiu1IiaJPT3YvQe6EYz8WKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782580236; c=relaxed/simple;
	bh=5ttfpm3ifddxsgXghuT2QVAd5kOHJ2Ff3lQ2OTVP4Ms=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Wikj8jkAMAJO/sL0a2914YjpMneNO96kWj0x5e+dA+z99E8e427xG8Qmvb0rZF23wp9jXor233/0pfsF+Sw33b92Z9AGSQ1jyLA1osbsRmqxAV90vIrn1LefQxn5gI6zmjwyu/oxeZvBWLi2fWSgbTeBlwX00oHBD26kwkDH1jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHcR6S/5; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHcR6S/5"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c0be5e548a4so261269466b.3
        for <fuse-devel@lists.linux.dev>; Sat, 27 Jun 2026 10:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782580233; x=1783185033; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ttfpm3ifddxsgXghuT2QVAd5kOHJ2Ff3lQ2OTVP4Ms=;
        b=iHcR6S/5FS25AG99TbrSSJS5vlqj7Nex1rNkzSEdCnDefA5jjhn2CIcQ6DTRqXpBNb
         BWbp7g4hWr9lg0oNWCflegDtvabTqNonsPXKp3w3qOOYT9GA2+R5EGaJKe8QoTXuXcLT
         DXVuLW7s63GSPd/WdW8+9WDI1a/gyqvOBCOdHMxor67+7FEGgTMLusNP49NWEK9oF11t
         +Uj9NVttfFb4daGpDhiZgx6xw/q2GugfwNvmFWiAT+CXJNW5srFuBH5Ay4R3yA7PpQGq
         3ErP+QtiJz0/C+yPieQzKv2oN7To2cuUFI0x5T0uzJkJMQ+g01mQ0CPQrXuQ6TufDqCQ
         gjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782580233; x=1783185033;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ttfpm3ifddxsgXghuT2QVAd5kOHJ2Ff3lQ2OTVP4Ms=;
        b=IssmzRdzy+NV9hk/j7hqB2VHimhR22Vh3p7d1abzYhMcA3ITLtMuG+5oZ+Ky4nGvRV
         r0qFHJu+ly26AeqYwNsylwKdt/aouKXMBwaHhQdp9t/lQ16WYLBpDKk2rM32rcRenKfD
         CxHcO3s3FN71PdqdrvKl7lVtbsAMRiUtzf2kISEJh7WQEYt6qF9uJjYk0MRH+NCTd+tG
         ngeyD8nGd80zfq8y6XXrsa23mT5nAgRKMTrr19h9vU6fgum7Zgxc29Lfmcj1Or5nJwMw
         vg8SSD7BzMryiUAZwYwO7u06ripAjFXX0XoqHxBmjwcZaCY0dPWyxP2JgliOTmp9+f4A
         11cw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2obI4KBDWFEpIiki84Z3QIDkE763ZJICGJvbbil1+hm06I8pfKZVRSh4SvtQJOfF7krS0oWRhCxX8@lists.linux.dev
X-Gm-Message-State: AOJu0Yxap5b8MyPlrsyKxuA1Wl83iHeXzvbyGkabvAGBp/FPh4S6T8Vg
	Ux18qoRS/VmQHZoIJNkW09elKfjBsB/V4Db02j7kAA2QoBqy4BddRGO+
X-Gm-Gg: AfdE7cn4p+6IskCMU3daxYrx5PCKhocRLZayyZXct4hBLPqemcBsqyQFWsQOXws7b40
	3nZybb0EVL4+jliNaZgFuJyc52UzAIdQS9ENTsdJ5Ts/9VXIsZkJOdF4UfooDJGcX7lejUsZvV2
	QeFyMa8HpjpvKs6a3AmATP9FvdQMwgsr9OL92hTS7d+nU9WaQVo8yBLSg59iBlInnI0qFDAu50s
	FsjQeeYZnoivvrLx9viNqJmmpyugERxMAnICLRZXPOMyktusYNBRU66G6yONhrE7VBtpX1q/TnN
	WTR23o8660CAMWCUr/W6svbYe0u9RTPD11pULqjTJgfolWHsoKNaR/uYRiOOwXa8+d7k6IQP9se
	nDhnuDme0fmUd95pNOnyCNCtoPmhs+QHC2RZY/a1P/9i8YltoQ0tyWIlAF0kkmMNSwg35x66zl/
	7LETxGfsTJdh8I4EDn+O4=
X-Received: by 2002:a17:907:7b8f:b0:c12:343d:d20d with SMTP id a640c23a62f3a-c12343dff47mr217096066b.39.1782580233392;
        Sat, 27 Jun 2026 10:10:33 -0700 (PDT)
Received: from localhost ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbac51asm504245166b.7.2026.06.27.10.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 10:10:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 17:10:30 +0000
Message-Id: <DJJZYCL2DGFB.3SAYSE3IIAJY1@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "Mahad Ibrahim"
 <mahad.ibrahim.dev@gmail.com>
Cc: "Miklos Szeredi" <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>, "Joanne Koong"
 <joannelkoong@gmail.com>
Subject: Re: [PATCH v2] fuse: replace passthrough backing-id IDR with a
 counter and hashtable
From: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260621183157.3490-1-mahad.ibrahim.dev@gmail.com>
 <20260626125131.2117-1-mahad.ibrahim.dev@gmail.com>
 <CAOQ4uxgX0Oqc+KnEHx6n01UfNQAOPfk3m2rQ3vYTGM98HOV0Yw@mail.gmail.com>
In-Reply-To: <CAOQ4uxgX0Oqc+KnEHx6n01UfNQAOPfk3m2rQ3vYTGM98HOV0Yw@mail.gmail.com>

Thank you Amir, this is incredibly helpful.

I hadn't thought about offloading the allocator to userspace, but now that
you mention it, it does make more sense given the server already manages
most of the backing file lifecycle. Thanks for that.

The two bugs are clear, I overlooked them. I'll scrutinize my code harder
from now on.

Since you asked whether Miklos agrees, I'll wait for his response. However
I will start learning about it right away.

And yeah! I am a student, an LFX kernel mentee under Shuah Khan.

Thanks,
Mahad
