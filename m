Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E1938422D
	for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388233; cv=none; b=LFyDG0aN8J9ozCiWRQRX7SpSsUng08DDbt2z8G5PSF1otN8j9sZRczNhLu++jm1XfVxaEYtXN2Op1doprqTqJX+cEcIUFjwvtpyr2FOAl+iBX38fWCuH2pXVlKRFwMVaa5GAQd5lInh0FyGfmrUZiMx3eFIabSgYuPND0CwFc40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388233; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3mzi27kLuX7uv5s3dGcEaX+IGtEa9qqqXCwPFrMezVRh2M3WBNa0PHVu0iNaXLHuaWZynFE88GWLOvMQvJmLpHM/Wgi1fGGtDN0JvOvOq38mmMkAhLy+8qhhup76VzPwqHka+k+jsVo7RLlcj7rGCXTSE1Ap41jrGorahf059I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id BF75768B05; Thu, 25 Jun 2026 13:50:26 +0200 (CEST)
Date: Thu, 25 Jun 2026 13:50:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: brauner@kernel.org, willy@infradead.org, hch@lst.de, djwong@kernel.org,
	miklos@szeredi.hu, linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: Re: [PATCH v2 1/2] iomap: add helper to mark folio uptodate
Message-ID: <20260625115026.GB18076@lst.de>
References: <20260624212925.1668662-1-joannelkoong@gmail.com> <20260624212925.1668662-2-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624212925.1668662-2-joannelkoong@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
