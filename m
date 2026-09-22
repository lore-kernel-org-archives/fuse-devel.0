Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F034C5275B1
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066615; cv=pass; b=iw+IxxljhQVuF0DXVfn9+oar5gjP/GD3MQxN7hMTiL5WoRjSDdqwluBMzhcK6bNVs/lcdoEDD1xm+jJEsynYn/MyCSFyQQxggzjFGwjRkYLnYAWDGs/9mdbiTT3xFUkbw12g+8SVVXL3RgLsJXxqxmE2X9qcsvnEyB6Vol+LUoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066615; c=relaxed/simple;
	bh=Mb80mzPmt5q0tWwpC3pbguC3fdGeYrjX/0Rh7FKLy9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hgm81x5M78WMscs/aGZES2pUfpps1vqGcywoysXqmhwnoyA++oK7YKZrDSSVLMJ1feBZfrodEnJEMZDpYaYiX5J3CFP9/z4Y+QZ8+GGzdPEcTkzCwnrb2vMVTWJBTbNJmP/W2zTwr+lhejLmQwZkyrLCr7uASGqPDb+UmSKhmvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJpsfGHz; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJpsfGHz"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa650c8so562900466b.0
        for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 01:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790066612; cv=none;
        d=google.com; s=arc-20260327;
        b=YpPrJpb7HRbHIqHgrg4CLoHZxaZUmjd1YkuBVuJRByumyL8rVA4VJdv6ncVgRLrnpJ
         6tMMHTJEJQ9SEYBVhvimXt2ziTkFK434LiskcQD+ys30flHMAI8HbXkOvx0QjVQQD7oS
         BO3NeKIM2Q5DfTIgBVfnrDa37fBUzOYQAkvf/NkcBJuqE46jkRrMrmRAkdGpPaiPVTHy
         37/py7yK6fM2ecNvUWbQDQK469PrLfX1Rum2cUz2E2QTsKgfGeDfFdnWtjEbrg5F+Fcx
         zIm01gLec9E5Jysnjbbu6ruzLGaakOwVGlEIwszaFlyYwobAiSO1ltQgpo6TzUcCwTiY
         mszQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gE9j0EP+4jD6AZvQU5nCszGOZA3fYSE2waHPXHkftWo=;
        fh=LSGkIxL+7O1MPXHhjOsZelXZcZzf1zyb+22wAIOwAjQ=;
        b=FD21VFfK0wVnd4CbSq958AkZ5soJsedxkYxhcom7JCsbqpY3rLFKrM9TzRbk+eR9EM
         MtmOuNhKeKxe7Tn+dabLsOKUrWMZUbVgEO6CGBzlRRANXa1ZV2QMXydVTwPB0Y+jk3gg
         aqmbMuLyWWmFohvrBG5TLy1LYcxm/pZeav29t9XiAlfIwfHsiu+FzpcU2SrZ93UdUezG
         FA4pGbkN9sdN14jFO0plzHrQVmXK5usQj3D19CBGaYcv/Vh6KrcAgWLBHdd2nkNc6ZcV
         5hJic1Tlp8bfLMMnzAthkbqQeFDGutOvI9nZgpEkreQNJVmVKPA2wDayqs1/MvCrazK2
         mDfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066612; x=1790671412; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gE9j0EP+4jD6AZvQU5nCszGOZA3fYSE2waHPXHkftWo=;
        b=UJpsfGHzKzK1R4h6IV/ohV9BHcvXv/FSfh/H2fqAaq5qpIKHramVITRaGg4CfZsOU6
         63OKTooYcX/n4EfSqeRKZaN7x+IzWx51M3MCtah6tKE6wMTvGU+cd70zuv+v7zqT7whH
         VBJXNJLB+zQ2Pb5QW3Pcs7YWxyY9joywxnA14B4n+KFv2UokWuCR9ymqk/WnxdZ1S6YW
         fMvV0EHrCatP1R2E6RWCK0VbqYooGKpHHMQsgAqVwRcCKZBGk6Y6It2rS12N3tHYd6ku
         vp4TjUZmxgqWzHE7u3+9PJPUp71N9yYrhh7Os0XoaIHcsaDryHE4fM42sM1nteGueR4E
         L3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066612; x=1790671412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gE9j0EP+4jD6AZvQU5nCszGOZA3fYSE2waHPXHkftWo=;
        b=tPdGB0RPJlRs2RpqjQeQJJL3lQoA5rsKHFJTZygd1dv/XqGx0/Z+//ky8jT2fkfO/D
         68WIgBgHh8e/jlxHYuARfNVHg28PLmbfDkaK14t5SoJ4Gac0OT8BctTxMAWaRAiehSMe
         QxzrnRD40KIGOXqXgvsd8cZaMcsTc3Xuq/auTtA4mITP10V6cOvKbn0NC9HvdpAm9WLq
         jBi5Q6o+UfHP41fHtJ919/oXYR6fzMamhM6qMkQJC/MLuvcqcZDMBbPcEZqD7Dptv/JC
         7qBVtqcOl8YjaT0UDasH+ppJrCVEZj64kvmuWQx7va2hhAgXeS1C8+KYIGre3okESCfv
         rqtg==
X-Gm-Message-State: AFuF++nWtN9g6HoUUKamlXTPeI1HxZ6WaMRBm5VgJMiVtBlRlDIoguqt
	7T/qJRJhuMA+r1KVOAyFpyI3dwMrBJ2P05eNhRei+7ZjFwmV4OuqWZVn8Fcy89wiyZWXPOvyOI7
	alaAt8gP6JPUBOZd5vFk90o/iGpaF9vPMDpQpVmA=
X-Gm-Gg: AYBFou0bONMcpNLPHPfd8UjuwM6kPEG118Y+1QdWmK6Kh+OBG7dCCNr7BTX18QwaIAE
	X7l5VrH6ZuD/W80sNMkl/cux8Sa2+AubwRydCFlPzpimNDfMLtFVmm5PEWTWZJeGHmXSo6496MA
	J+6IMUzWuaz599u55/dZsfcqBS/d1+dC984nbhshmdT8YKNONCAY/dAZ31lwCF+6xW4OJwz3n58
	dyai79mJJGOo8WLJhoSsasFR1U/gVrzC2IvQ9tyZnJLHVQ5ER1Q7Iop/m3V5kOXy0pdtNKVihna
	3jRvaTLw753CM9K5hVuwIz54CQIsDBfe3eidu2haq4ll9CwrT3/XYFQ2
X-Received: by 2002:a17:907:72cc:b0:c20:21be:ea75 with SMTP id
 a640c23a62f3a-c2a156482eamr1262194466b.8.1790066612032; Tue, 22 Sep 2026
 01:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-3-mszeredi@redhat.com>
In-Reply-To: <20260922061019.3320196-3-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 22 Sep 2026 10:43:18 +0200
X-Gm-Features: AcwNN1Xk804dZVlsKTv3qQQz1wN2f8TScZYpLOirXjh0YCmnEDYyCc1B5WHwRfA
Message-ID: <CAOQ4uxhKweRcDVK9da5KDCHjrdmpAh5bgKGbL=o0YPoedCx8nw@mail.gmail.com>
Subject: Re: [PATCH 02/11] fuse: use "vdax" naming for virtiofs DAX
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> We are introducing DAX functionality largely unrelated to the virtiofs
> code.  Rename dax -> vdax for the virtiofs case for clarity.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>

I am sure it has crossed your mind that leaving CONFIG_FUSE_DAX
all over the place is ugly and just as confusing.

You may want to create an alias in Kconfig and rename the checks
in the code to FUSE_VDAX:

config FUSE_VDAX
        def_bool FUSE_DAX

This should preserve old configs.

Anyway, with or without this config alias

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
